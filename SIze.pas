unit Size;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Hash, Mask;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  SizeTable:=StrToInt(Edit1.text);
  Form2.Close;
end;

procedure TForm2.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9', #8]) then
  begin
    key:=#0;
  end;
end;

end.
