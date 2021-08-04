unit Unit2; //微信代码学习3.2.1.154

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tlhelp32,
  Jpeg, u_debug, PsAPI, Vcl.StdCtrls, Vcl.ExtCtrls, IdBaseComponent, IdComponent,
  qrenc, IdTCPConnection, IdTCPClient, IdHTTP, System.Messaging, Vcl.CheckLst,
  Vcl.WinXPickers;

type
  TForm2 = class(TForm)
    IdHTTP1: TIdHTTP;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    LabeledEdit1: TLabeledEdit;
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckListBox1: TCheckListBox;
    Timer1: TTimer;
    Panel4: TPanel;
    Button3: TButton;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Edit1: TEdit;
    Button2: TButton;
    TimePicker1: TTimePicker;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Timer2: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckListBox1DblClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
  private
    procedure head_pic;
    function GetValue(offset: dword): ansistring;
    //消息订阅
    procedure sub;
  end;

var
  Form2: TForm2;
  g_data_txt: string;

implementation
{$R *.dfm}

uses
  wxCore, PubSub;

procedure tform2.sub;
var
  data: string;
begin
  MsgListener :=
    procedure(const Sender: TObject; const M: TMessage)
    begin
      data := (M as TMessage<tx>).Value.bb;

      if CheckListBox1.Items.IndexOf(data) = -1 then
        CheckListBox1.Items.Add(data);
//  MessageBus.Unsubscribe(TTextMessage, fFirstSubscriberID);
    end;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  if CheckLogin then
  begin

    label3.Caption := ('微信id:' + GetWxid);

    label4.Caption := ('昵称：' + GetNickname);

//    lstInfo.Items.add('区域：' + GetRegion);
//    lstInfo.Items.add('个性签名：' + GetSign);
//
//    lstInfo.Items.Add('手机号:' + GetPhone);

    head_pic();
    Panel4.Visible := false;
    Timer1.Enabled := false;
    self.BringToFront;
  end;
end;

procedure tform2.head_pic();
var
  imagestream: TMemoryStream;
  jpg: TJpegImage;
begin
  imagestream := TMemoryStream.Create();
  jpg := TJpegImage.Create;
  idhttp1.Get(GetHeadUrl, imagestream);
  imagestream.Position := 0;
  jpg.LoadFromStream(imagestream);
  image1.Picture.Assign(jpg);
  imagestream.Free;
  jpg.free;

end;

function tform2.GetValue(offset: dword): ansistring;
begin
  result := PansiChar(g_baseaddr + offset);
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  ChangeNickname(LabeledEdit1.Text);
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  g_data_txt := edit1.text;
  TThread.CreateAnonymousThread(
    procedure
    var
      i: Integer;
    begin

      for i := 0 to CheckListBox1.Items.Count - 1 do
      begin
        if CheckListBox1.Checked[i] then
        begin

          TThread.CreateAnonymousThread(
            procedure
            begin
              var s := CheckListBox1.Items[i];

              var arr := s.Split([' ']);
//          debug.Show(arr[0]);

              SendMsg(arr[0], g_data_txt.Trim);

            end).start;
          sleep(1000);

        end;
      end
    end).start;
  Edit1.Text := '';
end;

procedure TForm2.Button3Click(Sender: TObject);
begin    //得到二维码
//  GotoQr;
  qr(QrStr(), ExtractFilePath(ParamStr(0)) + '\QRcode.BMP', 1, 8, 0, 1, 0, 0, 0, clBlack, clWhite);
  image2.Picture.Bitmap.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\QRcode.BMP');

end;

//SendMsg(edit2.text, Edit1.Text);
procedure TForm2.CheckBox1Click(Sender: TObject);
begin
  TmpShield(CheckBox1.Checked);
end;

procedure TForm2.CheckBox3Click(Sender: TObject);
var
  i: Integer;
begin
  if CheckBox3.Checked then
  begin
    for i := 0 to CheckListBox1.Items.Count - 1 do

      CheckListBox1.Checked[i] := true;
  end
  else
  begin
    for i := 0 to CheckListBox1.Items.Count - 1 do

      CheckListBox1.Checked[i] := false;
  end;
end;

procedure TForm2.CheckListBox1DblClick(Sender: TObject);
begin
  if CheckListBox1.ItemIndex >= 0 then
  begin
    var s := CheckListBox1.Items[CheckListBox1.ItemIndex];

    var arr := s.Split([' ']);
    ShowMessage(arr[0]);
  end;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  Panel4.Width := Width;
  Panel4.Height := Height;
  Panel4.BringToFront;
  sub();
  SubscriptionId := message_bus.SubscribeToMessage(TMessage<tx>, MsgListener);
end;

end.

