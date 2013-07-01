unit Hash;

interface

uses
	Queue, SysUtils;

type
   THashItem = record         // ��������� ������� ����� ������
     Info: TList;
     Empty: Boolean;         // ���� �� �������
   end;

   THashTable = record
     Size: Integer;           // ����� ��������� � �������(�� ������)
     H: array of THashItem;  // ���-�������
   end;


function HashFunc(s:string):integer;
function Add(var HT:THashTable; inf,inf2:TInf):integer;
function Find(var HT:THashTable; Inf,res:Tinf ):Tinf;
procedure Delete(var HT:THashTable; k:Tinf);

var
	HT : THashTable;
  SizeTable : integer;

implementation

function HashFunc(s:string):integer; // ��� �������
var
	i:integer;
begin
	Result:= 0;
  for i:=1 to Length(s) do
  	Result:= Result+ord(s[i]);
  Result:= (Result mod SizeTable);
end;

function Add(var HT:THashTable; inf,inf2:TInf):integer;   // ���������� �������� � �������
var
	i:integer;
  r:PNode;
  s:string;
begin
  if HT.Size = SizeTable*3 then
  begin
    Result:= -3;   //������� �����������
    Exit;
  end
  else
  begin
    i:= HashFunc(Inf);
    if HT.H[i].Empty then
    begin
      with HT.H[i] do
      begin
        Empty:= False;
        Info.InsertList(info.BegList,inf,inf2);
      end;
      HT.Size:= HT.Size+1; // ���-�� ��������� � ������� �����������
      Result:= i;
    end
    else
    begin    //���������� ���������
      HT.H[i].info.InsertList(HT.H[i].info.BegList,inf,inf2);
      Result:= i;
    end;
  end;
end;

function Find(var HT:THashTable; Inf,res:Tinf ):Tinf;    // ����� �������� � �������� ������
//-1 ���� �� �������, ��� ��� ���������� ������� ���� �����������
//���� ������� ������, �� �������� ������� ����� ������� ��������
var
	i:integer;
  p:PNode;
begin
  i:= HashFunc(Inf);
	if not (HT.H[i].Empty) then
    Result:= HT.H[i].info.FindList(HT.H[i].info.BegList,inf)
  else
  	Result:= '�� �������';
end;


procedure Delete(var HT:THashTable; k:Tinf);   // �������� ��������
var
	i:integer;
  res:boolean;
begin
	i:= HashFunc(k);
  if not (HT.H[i].Empty) then
    HT.H[i].info.DeleteList(HT.H[i].info.BegList,k)
end;

end.
