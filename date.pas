//
unit Date;

function visokos(year: integer):boolean;      // функция для определения високосности года
    begin
        if (year mod 400 = 0) then      
            visokos:= True
        else if year mod 100 = 0 then   
            visokos:= False
        else if year mod 4 = 0 then     
            visokos:= True
        else                            
            visokos:= False
            
    end;

function maxday( month: integer; year: integer ):integer;	// определение кол-ва дней в месяце
    begin
        case month of
            1: maxday:= 31;
            2: if visokos(year) = True then
                    maxday:= 29
                else
                    maxday:= 28;
            3:  maxday:= 31;
            4:  maxday:= 30;
            5:  maxday:= 31;
            6:  maxday:= 30;
            7:  maxday:= 31;
            8:  maxday:= 31;
            9:  maxday:= 30;
            10: maxday:= 31;
            11: maxday:= 30;
            12: maxday:= 31
        end;
    end;


function weekday(year_r: integer; month_r: integer; day: integer): integer;       // основная функция нахождения дня недели
    begin
    
    var temp, month, year_code, year_c :integer;                                                 
    
    case month_r of               // кейс для нахождения кодов месяцев
        1, 10: month:= 1;       // 1 — январь, октябрь;
        2, 3, 11: month:= 4;    // 4 — февраль, март, ноябрь;
        4, 7: month:= 0;        //  0 — апрель, июль;
        5: month:=2;            // 2 — май;
        6: month:=5;            // 5 — июнь;
        8: month:=3;            // 3 — август;
       9, 12: month:= 6;       // 6 — декабрь, сентябрь;
    end;
    
    case year_r mod 100 of        // определение кода для каждого столетия
        16: year_code:= 6;
        17: year_code:= 4; 
        18: year_code:= 2;
        19: year_code:= 0;
        20: year_code:= 6;
        21: year_code:= 4;    
        end;


    year_c := (year_code + (year_r mod 100) + ((year_r mod 100) div 4))mod 7;     // формула нахождения кода года
    
    temp := ((day + month + year_r) mod 7);                           
    
    if (visokos(year_r) = True) and (month_r <= 2) then                                    // если год високосный, то день недели уменьшается (сдвигается) на один
        temp-= 3
    else
        temp-= 2;
    
    if temp <= 0 then                                                // если день меньше нуля
        temp+=7;
    

    weekday:=temp; 
    
    end;
    

function monthname(num: integer): string;
    begin

      case num of
      1: monthname:= 'January'; 
      2: monthname:= 'February'; 
      3: monthname:= 'March'; 
      4: monthname:= 'April'; 
      5: monthname:= 'May'; 
      6: monthname:= 'June'; 
      7: monthname:= 'July'; 
      8: monthname:= 'August'; 
      9: monthname:= 'September'; 
      10: monthname:= 'October'; 
      11: monthname:= 'November'; 
      12: monthname:= 'December';
      end;

	end;
end. 