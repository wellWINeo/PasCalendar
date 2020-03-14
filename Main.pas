uses crt, date, display;



var max, first, month, year : integer;
var quit : Boolean;
var k: char;

begin
  
  month:= 3;
  year:= 2020;

  quit:= False;
  	
  
    
  SetWindowSize(60, 25);      
  TextBackground(0);      
  
  while quit = False do
  
    begin
    
    max:= maxday( month , year );
    
    writeln ( monthname( month ) );
    Writeln (year);
    WriteLn ();

    first:= weekday ( year, month, 1);
    
    header;
    
    show(first, max, month, year);
    
    writeln();
    writeln();
    writeln();
    writeln ('Для выхода нажмите q, для передвижения между месяцами ');
    WriteLn ('используйте a и d');
    WriteLn ('для возвращения к текущему месяцу нажмите s ');
    k:= ReadKey;

    if (k = 'q') or (k = 'Q') or (k = 'й') or (k = 'Й') then quit:= True
    else if (k = 'a') or (k = 'A') or (k = 'ф') or (k = 'Ф') then month-=1
    else if (k = 'd') or (k = 'D') or (k = 'в') or (k = 'В') then month+=1
    else if (k = 's') or (k = 'S') or (k = 'ы') or (k = 'Ы') then 
      begin
        month:= System.DateTime.Now.Month;
        year:= System.DateTime.Now.Year;
        end;
    if month > 12 then 
		  begin
		  
      month:= 1;
		  year+=1;
		  
      end
    
    else if month < 1 then 
		  begin
		  month:= 12;
		  year-=1;
		  end;
		clrscr;
    end;

end. 
