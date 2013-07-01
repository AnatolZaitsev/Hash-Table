unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Queue, Hash, StdCtrls, Grids, Size;

type
  TFormHashMain = class(TForm)
    ButtonAdd: TButton;
    StringGrid1: TStringGrid;
    EditItem: TEdit;
    ButtonFind: TButton;
    ButtonDelete: TButton;
    ButtonRandomize: TButton;
    EditKey: TEdit;
    LabelKey: TLabel;
    LabelItem: TLabel;
    EditSize: TEdit;
    Label1: TLabel;
    procedure ButtonAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonFindClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure ButtonRandomizeClick(Sender: TObject);

  private
    { Private declarations }
  public
     procedure SetGrid(HT: THashTable);
     procedure ClearTable;
  end;

var
  FormHashMain: TFormHashMain;

implementation

procedure TFormHashMain.ClearTable;  //  Очистка всей таблицы StringGrid1
var
	i:integer;
begin
  with StringGrid1 do
    for i:=0 to ColCount-1 do
      Cols[i].Clear;
end;

procedure TFormHashMain.SetGrid(HT: THashTable);
var
  i,j: integer;
  p: PNode;
begin
  if HT.size = 0 then
    Exit;
  with StringGrid1 do
    for i:=0 to SizeTable-1 do
    begin
      j:= 2;
      Cells[0,i]:= IntToStr(i+1);
      if HT.H[i].Info.BegList = nil then
        Cells[1,i]:= ''
      else
      begin
        Cells[1,i]:= HT.H[i].Info.BegList.inf2+' '+HT.H[i].Info.BegList.inf;
        p:= HT.H[i].Info.BegList;
        while (p <> nil) and (p^.next <> nil) do
        begin
       	  p:= p^.next;
          Cells[j,i]:= p.inf2+' "'+p.inf+'"';
          Inc(j);
        end;
      end;
    end;
end;


{$R *.dfm}

procedure TFormHashMain.ButtonAddClick(Sender: TObject);
var
	k:integer;
begin
	k:= Add(HT,EditKey.text,EditItem.text);
  if k=-3 then
    ShowMessage('Таблица переполнена');
  ClearTable;
  SetGrid(HT);
end;

procedure TFormHashMain.FormCreate(Sender: TObject);
var
	i:integer;
begin
	Form2:=TForm2.Create(self);
  Form2.ShowModal;
	SetLength(HT.H,SizeTable);
	For i:= 0 to SizeTable-1 do
  begin
  	HT.H[i].empty:= True;
    HT.H[i].info:= TList.Create;
  end;
end;

procedure TFormHashMain.ButtonFindClick(Sender: TObject);
var
	k:integer;
  s,s1:string;
begin
	s:=EditKey.Text;
	s1:=Find(HT,s,s1);
  if k=-1 then
    Showmessage('Элемента с данным ключом не существует');
  Showmessage(s1);
end;

procedure TFormHashMain.ButtonDeleteClick(Sender: TObject);
begin
	Delete(HT,EditKey.text);
  ClearTable;
  SetGrid(HT);
end;

procedure TFormHashMain.ButtonRandomizeClick(Sender: TObject);
begin
  if EditSize.text <> '' then
    SizeTable:= StrToInt(EditSize.text)
  else
    Showmessage('Неверное значение кол-ва ячеек');
  StringGrid1.RowCount:= SizeTable;
  StringGrid1.ColCount:= SizeTable;
end;

end.
