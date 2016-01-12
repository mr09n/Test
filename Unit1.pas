unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TSpaghetti = class
  public
    Name : String;
    Description : String;

    function GetPrice() : Integer; virtual;
    function GetName() : String; virtual;
    function GetDiscription() : String; virtual;
  end;

  TCondimentDecorator = class(TSpaghetti)

  end;

  TNormalSpaghetti = class(TSpaghetti)
  public
    function GetPrice : Integer; override;
    function GetName : String; override;
    function GetDiscription : String; override;
  end;

  TCondimentA = class(TCondimentDecorator)
  private
    FSpaghetti : TSpaghetti;
  public
    Constructor Create(Spaghetti : TSpaghetti);
    function GetPrice : Integer; override;
    function GetName : String; override;
    function GetDiscription : String; override;
  end;

  TCondimentB = class(TCondimentDecorator)
  private
    FSpaghetti : TSpaghetti;
  public
    Constructor Create(Spaghetti : TSpaghetti);
    function GetPrice : Integer; override;
    function GetName : String; override;
    function GetDiscription : String; override;
  end;

  TForm1 = class(TForm)
    Button1: TButton;
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
  NormalSpaghetti : TSpaghetti;
  i : Integer;
begin
  NormalSpaghetti := TNormalSpaghetti.Create();
  for i := 1 to 5 do
    NormalSpaghetti := TCondimentA.Create(NormalSpaghetti);
  NormalSpaghetti := TCondimentB.Create(NormalSpaghetti);

  showmessage(NormalSpaghetti.GetName + ', ' + NormalSpaghetti.GetDiscription() + ', ' + inttostr(NormalSpaghetti.GetPrice));
end;

{ TSpaghetti }

function TSpaghetti.GetDiscription: String;
begin
  Result := Description;
end;

function TSpaghetti.GetName: String;
begin
  Result := Name;
end;

function TSpaghetti.GetPrice: Integer;
begin
  Result := 0;
end;

{ TNormalSpaghetti }

function TNormalSpaghetti.GetDiscription: String;
begin
  Result := 'I''m NormalSpaghetti Noodle';
end;

function TNormalSpaghetti.GetName: String;
begin
  Result := 'NormalSpaghetti';
end;

function TNormalSpaghetti.GetPrice: Integer;
begin
  Result := 100;
end;

{ TCondimentA }

constructor TCondimentA.Create(Spaghetti : TSpaghetti);
begin
  inherited Create;
  FSpaghetti := Spaghetti;
end;

function TCondimentA.GetDiscription: String;
begin
  Result := FSpaghetti.GetName + ', ' + '123---CondimentA';
end;

function TCondimentA.GetName: String;
begin
  Result := FSpaghetti.GetName + ', ' + 'I''m CondimentA';
end;

function TCondimentA.GetPrice: Integer;
begin
  Result := FSpaghetti.GetPrice + 10;
end;

{ TCondimentB }

constructor TCondimentB.Create(Spaghetti: TSpaghetti);
begin
  inherited Create;
  FSpaghetti := Spaghetti;
end;

function TCondimentB.GetDiscription: String;
begin
  Result := FSpaghetti.GetName + ', ' + '123---CondimentB';
end;

function TCondimentB.GetName: String;
begin
  Result := FSpaghetti.GetName + ', ' + 'I''m CondimentB';
end;

function TCondimentB.GetPrice: Integer;
begin
  Result := FSpaghetti.GetPrice + 13;
end;

end.
