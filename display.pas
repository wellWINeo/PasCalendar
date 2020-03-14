//
unit display;

uses crt;

procedure header();  
    begin
    write('     ПН     ВТ     СР     ЧТ     ПН     ');    // хедер
    TextColor(Red);
    writeln('СБ     ВС'); 
    TextColor(White);
    end;


procedure print_cur_date ( n: integer);
  begin
      TextColor ( green );
      write (n);
      TextColor ( white );
  end;


procedure show(i, max, month, year: integer);	

    
    var wl, dl, cur_d, fict_d, now_d : Integer;

    begin
    
    cur_d:= 1;
    fict_d:= 1;
    
    if ( month = System.DateTime.Now.Month ) and ( year = System.DateTime.Now.Year ) then now_d:= System.DateTime.Now.Day
    else now_d:= 0;


      for wl:= 1 to 6 do
        
        begin

        writeln();

            
            for dl:= 1 to 7 do
            
            begin
            
            if cur_d <= max then
                begin    
                
                if fict_d < i then 
                    write ('     --')
                else
                    begin 
                    write('    ');
                    if cur_d <> now_d then
                        begin 
                        
                        if cur_d div 10 = 0 then 
                            begin 
                            write('  ', cur_d );
                            end
                        else 
                            write(' ', cur_d );
                        end
                    else if cur_d div 10 = 0 then 
                            begin
                            write('  ');
                            print_cur_date ( cur_d );
                            end
                        else 
                            begin
                            write(' ');
                            print_cur_date ( cur_d ); 
                            end;

                    cur_d+= 1;
                    end; 

                fict_d+= 1;
                
                end
            else 
                break;        

            end; 

        end;

    end;
  
end. 