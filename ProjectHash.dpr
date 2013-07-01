program ProjectHash;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  Hash in 'Hash.pas',
  Queue in 'Queue.pas',
  Size in 'Size.pas'; {Form2}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormHashMain, FormHashMain);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
