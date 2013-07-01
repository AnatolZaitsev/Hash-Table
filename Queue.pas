unit Queue;

interface

uses
  SysUtils;

type
  TInf = string;
  PNode = ^TNode;
  TNode = record
    inf: Tinf;
    inf2: TInf;
    Next,Pred: PNode;
  end;

  TList = class
  public
    BegList: PNode;
    constructor Create;
    destructor Destroy;
    procedure InitList(var x:PNode);
    function FindList(var q: PNode; k:Tinf):TInf;
    procedure DeleteList(var p: PNode; k: TInf);
    procedure InsertList(var p: PNode; k,l: TInf);
  end;

var
  List: Tlist;

implementation

constructor TList.Create;
begin

end;

destructor TList.Destroy;
begin

end;

procedure TList.DeleteList(var p: PNode; k: TInf);
var
  r: PNode;
begin
  if p = nil then                                  //если список пуст
    Exit;

  if (p.inf2 = k) and (p^.Next <> nil) then      // если первый элемент искомый, дальше список есть
  begin
    r:= p;
    r^.Pred^.Next:= nil;
    p:= p^.Pred;
    Dispose(r);
    Exit;
  end;

  if (p.Pred = nil) and (p.inf2 = k) then       //если первый элемент искомый,дальше список есть
  begin
   p:= nil;
   Exit;
  end;

  if p.inf2 <> k then                             //если первый элемент не искомый
  begin
    r:= p;
    while r.inf2 <> k do
      r:= r^.Next;

    if r.Next = nil then                              //если элемент последний
    begin
      r^.Pred^.Next:= nil;
      Dispose(r);
    end
    
    else
    begin                                          //если элемент не последний
      r^.Pred^.Next:= r^.Next;
      r^.Next^.Pred:= r^.Pred;
      Dispose(r);
    end;
  end;

end;


function Tlist.FindList(var q: PNode; k:Tinf):TInf;
var
	p:Pnode;
  ok:boolean;
begin
  ok:= False;
  p:= q;
  while not ok and (p <> nil) do
    if p^.inf2 = k then
    begin
    	Result:= p.inf;
      ok:= True;
    end
    else
      p:= p^.Next;
  if not ok then
    p:= nil;
end;

procedure TList.InsertList(var p: PNode; k,l: TInf);
var
  t,r:PNode;
	i:integer;
begin
  if p = Nil then
  begin
    New(t);
    with t^ do
    begin
      Inf:= l;   // значение
      inf2:= k;  // ключ
      Next:= nil;
      pred:= nil;
      p:= t;
    end;
  end
  else
  begin
     r:= p;
  repeat
     if r.inf2 = k then
     begin
       r.Inf:= l;
       Exit;
     end
  else
  	r:= r^.Next;
  until r = nil;
  	r:= p;
    while r.Next <> nil do
       r:=r^.Next;
    new(t);
    with t^ do
    begin
      Inf:= l;   // значение
      inf2:= k;  // ключ
      Next:= nil;
      Pred:= r;
      r.Next:= t;
      r:= t;
    end;
  end
end;

procedure Tlist.InitList(var x:PNode);
begin
  x:= nil;
end;

end.
