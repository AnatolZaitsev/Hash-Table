unit Hash;

interface

uses
  Queue, SysUtils;

type
   THashItem = record         // индексами массива будут записи
     Info: TList;
     Empty: Boolean;         // пустой элемент или нет
   end;

   THashTable = record
     Size: Integer;           // число элементов в таблице
     H: array of THashItem;  // хэш-таблица
   end;


function HashFunc(s:string):integer;
function Add(var HT:THashTable; inf,inf2:TInf):integer;
function Find(var HT:THashTable; Inf,res:Tinf ):Tinf;
procedure Delete(var HT:THashTable; k:Tinf);

var
  HT : THashTable;
  SizeTable : integer;

implementation

function HashFunc(s:string):integer; // Хэш-функция
var
  i:integer;
begin
  Result:= 0;
  for i:=1 to Length(s) do
    Result:= Result+ord(s[i]);
  Result:= (Result mod SizeTable);
end;

function Add(var HT:THashTable; inf,inf2:TInf):integer;   // Добавление элемента в таблицу
var
  i:integer;
begin
  if HT.Size = SizeTable*3 then
  begin
    Result:= -3;   // таблица переполнена
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
      HT.Size:= HT.Size+1; // Кол-во элементов в таблице увеличилось
      Result:= i;
    end
    else
    begin    // разрешение коллизии
      HT.H[i].info.InsertList(HT.H[i].info.BegList,inf,inf2);
      Result:= i;
    end;
  end;
end;

function Find(var HT:THashTable; Inf,res:Tinf ):Tinf;    // Поиск элемента с заданным ключом
var
  i:integer;
begin
  i:= HashFunc(Inf);
  if not (HT.H[i].Empty) then
    Result:= HT.H[i].info.FindList(HT.H[i].info.BegList,inf)
  else
    Result:= 'Не найдено';
end;


procedure Delete(var HT:THashTable; k:Tinf);   // Удаление элемента по ключу
var
  i:integer;
begin
  i:= HashFunc(k);
  if not (HT.H[i].Empty) then
    HT.H[i].info.DeleteList(HT.H[i].info.BegList,k)
end;

end.
