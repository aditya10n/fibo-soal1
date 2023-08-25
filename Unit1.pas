unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Depth, i: Integer;
  Previous, Current, Next: Integer;
begin
  // Mengambil nilai kedalaman dari Edit1
  Depth := StrToIntDef(Edit1.Text, 0);

  if Depth <= 0 then
  begin
    ShowMessage('Masukkan kedalaman angka yang valid (angka positif).');
    Exit;
  end;

  // Reset memo untuk hasil baru
  Memo1.Clear;

  Previous := 0;
  Current := 1;

  Memo1.Lines.Add(IntToStr(Previous)); // Tampilkan angka pertama
  Memo1.Lines.Add(IntToStr(Current)); // Tampilkan angka kedua

  // Menghitung dan menampilkan deret Fibonacci sesuai dengan kedalaman yang diminta
  for i := 3 to Depth+1 do
  begin
    Next := Previous + Current;
    Memo1.Lines.Add(IntToStr(Next));
    Previous := Current;
    Current := Next;
  end;
end;

end.

