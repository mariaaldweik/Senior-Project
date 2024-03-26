% Open the file for reading
fileID_read = fopen('test.txt', 'r');

% Check if the file opened successfully
if fileID_read == -1
    error('Could not open input file');
end

% Initialize cell array to store lines
lines = {};

% Read each line until the end of the file
line = fgetl(fileID_read);
while ischar(line)
    % Append the line to the cell array
    lines{end+1} = line
    % Read the next line
    line = fgetl(fileID_read);
end


decimall={};


A = {'D+1; nul','D+1; JGT','D+1; JEQ','D+1; JGE','D+1; JLT','D+1; JNE','D+1; JLE','D+1; JMP';...
     'D-1; nul','D-1; JGT','D-1; JEQ','D-1; JGE','D-1; JLT','D-1; JNE','D-1; JLE','D-1; JMP';...
     'A+1; nul','A+1; JGT','A+1; JEQ','A+1; JGE','A+1; JLT','A+1; JNE','A+1; JLE','A+1; JMP';...
     'A-1; nul','A-1; JGT','A-1; JEQ','A-1; JGE','A-1; JLT','A-1; JNE','A-1; JLE','A-1; JMP';...
     'D+A; nul','D+A; JGT','D+A; JEQ','D+A; JGE','D+A; JLT','D+A; JNE','D+A; JLE','D+A; JMP';...
     'D-A; nul','D-A; JGT','D-A; JEQ','D-A; JGE','D-A; JLT','D-A; JNE','D-A; JLE','D-A; JMP';...
     'A-D; nul','A-D; JGT','A-D; JEQ','A-D; JGE','A-D; JLT','A-D; JNE','A-D; JLE','A-D; JMP';...
     'D&A; nul','D&A; JGT','D&A; JEQ','D&A; JGE','D&A; JLT','D&A; JNE','D&A; JLE','D&A; JMP';...
     'D|A; nul','D|A; JGT','D|A; JEQ','D|A; JGE','D|A; JLT','D|A; JNE','D|A; JLE','D|A; JMP';...
     '0; nul','0; JGT','0; JEQ','0; JGE','0; JLT','0; JNE','0; JLE','0; JMP';...
     '1; nul','1; JGT','1; JEQ','1; JGE','1; JLT','1; JNE','1; JLE','1; JMP';...
     '-1; nul','-1; JGT','-1; JEQ','-1; JGE','-1; JLT','-1; JNE','-1; JLE','-1; JMP';...
     'D; nul','D; JGT','D; JEQ','D; JGE','D; JLT','D; JNE','D; JLE','D; JMP';...
     'A; nul','A; JGT','A; JEQ','A; JGE','A; JLT','A; JNE','A; JLE','A; JMP';...
     '!D; nul','!D; JGT','!D; JEQ','!D; JGE','!D; JLT','!D; JNE','!D; JLE','!D; JMP';...
     '!A; nul','!A; JGT','!A; JEQ','!A; JGE','!A; JLT','!A; JNE','!A; JLE','!A; JMP';...
     '-D; nul','-D; JGT','-D; JEQ','-D; JGE','-D; JLT','-D; JNE','-D; JLE','-D; JMP';...
     '-A; nul','-A; JGT','-A; JEQ','-A; JGE','-A; JLT','-A; JNE','-A; JLE','-A; JMP';...
     'M; nul','M; JGT','M; JEQ','M; JGE','M; JLT','M; JNE','M; JLE','M; JMP';...
     '!M; nul','!M; JGT','!M; JEQ','!M; JGE','!M; JLT','!M; JNE','!M; JLE','!M; JMP';...
     '-M; nul','-M; JGT','-M; JEQ','-M; JGE','-M; JLT','-M; JNE','-M; JLE','-M; JMP';...
     'M+1; nul','M+1; JGT','M+1; JEQ','M+1; JGE','M+1; JLT','M+1; JNE','M+1; JLE','M+1; JMP';...
     'M-1; nul','M-1; JGT','M-1; JEQ','M-1; JGE','M-1; JLT','M-1; JNE','M-1; JLE','M-1; JMP';...
     'D+M; nul','D+M; JGT','D+M; JEQ','D+M; JGE','D+M; JLT','D+M; JNE','D+M; JLE','D+M; JMP';...
     'D-M; nul','D-M; JGT','D-M; JEQ','D-M; JGE','D-M; JLT','D-M; JNE','D-M; JLE','D-M; JMP';...
     'M-D; nul','M-D; JGT','M-D; JEQ','M-D; JGE','M-D; JLT','M-D; JNE','M-D; JLE','M-D; JMP';...
     'D&M; nul','D&M; JGT','D&M; JEQ','D&M; JGE','D&M; JLT','D&M; JNE','D&M; JLE','D&M; JMP';...
     'D|M; nul','D|M; JGT','D|M; JEQ','D|M; JGE','D|M; JLT','D|M; JNE','D|M; JLE','D|M; JMP'
     }
str=string(A);

temp={};
binary_array={};
% Iterate through each element in the lines array
for i = 1:numel(lines)
    line = lines{i};  % Get the current line
    
    % Iterate through each character in the line
    for j = 1:length(line)
       
        character1 = line(j);
        character2 = line(2);
        character3 = line(3);

        if(character1 =='@')
            temp{i}=str2num(line(2:end))
        decimall{i}=temp{i}
        break
        end
        %D
         if(character1 =='D'&&character2 ~='A'&&character3 ~='M')
           decimall{i}=16+57344;
            temp = line(3:end);
         end
         %M
         if(character1 =='M'&&character2 ~='A'&&character3 ~='D')
            decimall{i}=8+57344;
            temp = line(3:end);
         end
         %A
           if(character1 =='A'&&character2 ~='M'&&character3 ~='D')
            decimall{i}=32+57344;
            temp = line(3:end);
           end
           %AM
            if(character1 =='A'&&character2 =='M'&&character3 ~='D')
            decimall{i}=40+57344;
            temp = line(3:end);
            end
            %AMD
            if(character1 =='A'&&character2 =='M'&&character3 =='D')
            decimall{i}=56+57344;
            temp = line(3:end);
            end
            %MD
             if(character1 =='M'&&character2 =='D'&&character3 ~='A')
            decimall{i}=24+57344;
            temp = line(3:end);
             end
              %AD
            if(character1 =='A'&&character2 =='D'&&character3 ~='M')
            decimall{i}=48+57344;
            temp = line(3:end);
            end
              %nul
            if(character1 =='n'&&character2 =='u'&&character3 =='l')
            decimall{i}=0+57344;
            temp = line(3:end);
            end

         % START OF D+1
            if( temp == str(1,1))  
            decimall{i}=decimall{i}+1984; 
          break
            end 
          if(temp ==str(1,2))
          decimall{i}=decimall{i}+1984+1;
          break
          end
          if(temp ==str(1,3))
             decimall{i}=decimall{i}+1984+2;
          break
          end
          if(temp ==str(1,4))
           decimall{i}=decimall{i}+1984+3;
          break
          end
          if(temp ==str(1,5))
             decimall{i}=decimall{i}+1984+4;
          break
          end
          if(temp ==str(1,6))
             decimall{i}=decimall{i}+1984+5;
          break
          end
       if(temp ==str(1,7))
             decimall{i}=decimall{i}+1984+6;
          break
       end
                   if(temp ==str(1,8))
             decimall{i}=decimall{i}+1984+7;
          break
                   end
                   
            
      %END OF D+1
       % START OF D-1
          
            if(temp ==str(2,1))
             decimall{i}=decimall{i}+896;
          break
            end 
          if(temp ==str(2,2))
          decimall{i}=decimall{i}+896+1;
          break
          end
          if(temp ==str(2,3))
             decimall{i}=decimall{i}+896+2;
          break
          end
          if(temp ==str(2,4))
           decimall{i}=decimall{i}+896+3;
          break
          end
          if(temp ==str(2,5))
             decimall{i}=decimall{i}+896+4;
          break
          end
          if(temp ==str(2,6))
             decimall{i}=decimall{i}+896+5;
          break
          end
       if(temp ==str(2,7))
             decimall{i}=decimall{i}+896+6;
          break
       end
                   if(temp ==str(2,8))
             decimall{i}=decimall{i}+896+7;
          break
                   end
                   
            
      %END OF D-1
                        
  % START OF A+1
           
            if(temp ==str(3,1))
             decimall{i}=decimall{i}+3520;
          break
            end 
          if(temp ==str(3,2))
          decimall{i}=decimall{i}+3520+1;
          break
          end
          if(temp ==str(3,3))
             decimall{i}=decimall{i}+3520+2;
          break
          end
          if(temp ==str(3,4))
           decimall{i}=decimall{i}+3520+3;
          break
          end
          if(temp ==str(3,5))
             decimall{i}=decimall{i}+3520+4;
          break
          end
          if(temp ==str(3,6))
             decimall{i}=decimall{i}+3520+5;
          break
          end
       if(temp ==str(3,7))
             decimall{i}=decimall{i}+3520+6;
          break
       end
                   if(temp ==str(3,8))
             decimall{i}=decimall{i}+3520+7;
          break
                   end
                   
            
      %END OF A+1
        % START OF A-1
          
            if(temp ==str(4,1))
             decimall{i}=decimall{i}+3200;
          break
            end 
          if(temp ==str(4,2))
          decimall{i}=decimall{i}+3200+1;
          break
          end
          if(temp ==str(4,3))
             decimall{i}=decimall{i}+3200+2;
          break
          end
          if(temp ==str(4,4))
           decimall{i}=decimall{i}+3200+3;
          break
          end
          if(temp ==str(4,5))
             decimall{i}=decimall{i}+3200+4;
          break
          end
          if(temp ==str(4,6))
             decimall{i}=decimall{i}+3200+5;
          break
          end
       if(temp ==str(4,7))
             decimall{i}=decimall{i}+3200+6;
          break
       end
                   if(temp ==str(4,8))
             decimall{i}=decimall{i}+3200+7;
          break
                   end
                   
            
      %END OF A-1
            %START OF D+A

       if(temp ==str(5,1))
             decimall{i}=decimall{i}+128;
          break
            end 
          if(temp ==str(5,2))
          decimall{i}=decimall{i}+128+1;
          break
          end
          if(temp ==str(5,3))
             decimall{i}=decimall{i}+128+2;
          break
          end
          if(temp ==str(5,4))
           decimall{i}=decimall{i}+128+3;
          break
          end
          if(temp ==str(5,5))
             decimall{i}=decimall{i}+128+4;
          break
          end
          if(temp ==str(5,6))
             decimall{i}=decimall{i}+128+5;
          break
          end
       if(temp ==str(5,7))
             decimall{i}=decimall{i}+128+6;
          break
       end
                   if(temp ==str(5,8))
             decimall{i}=decimall{i}+128+7;
          break
                   end
                   
            
      %END OF D+A
      %START OF D-A
       if(temp ==str(6,1))
             decimall{i}=decimall{i}+1216;
          break
            end 
          if(temp ==str(6,2))
          decimall{i}=decimall{i}+1216+1;
          break
          end
          if(temp ==str(6,3))
             decimall{i}=decimall{i}+1216+2;
          break
          end
          if(temp ==str(6,4))
           decimall{i}=decimall{i}+1216+3;
          break
          end
          if(temp ==str(6,5))
             decimall{i}=decimall{i}+1216+4;
          break
          end
          if(temp ==str(6,6))
             decimall{i}=decimall{i}+1216+5;
          break
          end
       if(temp ==str(6,7))
             decimall{i}=decimall{i}+1216+6;
          break
       end
                   if(temp ==str(6,8))
             decimall{i}=decimall{i}+1216+7;
          break
                   end
                   
            
      %END OF D-A
          % START OF A-D
          
            if(temp ==str(7,1))
             decimall{i}=decimall{i}+448;
          break
            end 
          if(temp ==str(7,2))
          decimall{i}=decimall{i}+448+1;
          break
          end
          if(temp ==str(7,3))
             decimall{i}=decimall{i}+448+2;
          break
          end
          if(temp ==str(7,4))
           decimall{i}=decimall{i}+448+3;
          break
          end
          if(temp ==str(7,5))
             decimall{i}=decimall{i}+448+4;
          break
          end
          if(temp ==str(7,6))
             decimall{i}=decimall{i}+448+5;
          break
          end
       if(temp ==str(7,7))
             decimall{i}=decimall{i}+448+6;
          break
       end
                   if(temp ==str(7,8))
             decimall{i}=decimall{i}+448+7;
          break
                   end
                   
            
      %END OF A-D
        % START OF D&A
          
            if(temp ==str(8,1))
             decimall{i}=decimall{i};
          break
            end 
          if(temp ==str(8,2))
          decimall{i}=decimall{i}+1;
          break
          end
          if(temp ==str(8,3))
             decimall{i}=decimall{i}+2;
          break
          end
          if(temp ==str(8,4))
           decimall{i}=decimall{i}+3;
          break
          end
          if(temp ==str(8,5))
             decimall{i}=decimall{i}+4;
          break
          end
          if(temp ==str(8,6))
             decimall{i}=decimall{i}+5;
          break
          end
       if(temp ==str(8,7))
             decimall{i}=decimall{i}+6;
          break
       end
                   if(temp ==str(8,8))
             decimall{i}=decimall{i}+7;
          break
                   end
                   
            
      %END OF D&A
        % START OF D|A
          
            if(temp ==str(9,1))
             decimall{i}=decimall{i}+1344;
          break
            end 
          if(temp ==str(9,2))
          decimall{i}=decimall{i}+1344+1;
          break
          end
          if(temp ==str(9,3))
             decimall{i}=decimall{i}+1344+2;
          break
          end
          if(temp ==str(9,4))
           decimall{i}=decimall{i}+1344+3;
          break
          end
          if(temp ==str(9,5))
             decimall{i}=decimall{i}+1344+4;
          break
          end
          if(temp ==str(9,6))
             decimall{i}=decimall{i}+1344+5;
          break
          end
       if(temp ==str(9,7))
             decimall{i}=decimall{i}+1344+6;
          break
       end
                   if(temp ==str(9,8))
             decimall{i}=decimall{i}+1344+7;
          break
                   end
                   
            
      %END OF D|A
              % START OF 0
          
            if(temp ==str(10,1))
             decimall{i}=decimall{i}+2688;
          break
            end 
          if(temp ==str(10,2))
          decimall{i}=decimall{i}+2688+1;
          break
          end
          if(temp ==str(10,3))
             decimall{i}=decimall{i}+2688+2;
          break
          end
          if(temp ==str(10,4))
           decimall{i}=decimall{i}+2688+3;
          break
          end
          if(temp ==str(10,5))
             decimall{i}=decimall{i}+2688+4;
          break
          end
          if(temp ==str(10,6))
             decimall{i}=decimall{i}+2688+5;
          break
          end
       if(temp ==str(10,7))
             decimall{i}=decimall{i}+2688+6;
          break
       end
       if(temp ==str(10,8))
             decimall{i}=decimall{i}+2688+7;
          break
                   end
                   
            
      %END OF 0
      % START OF 1
          
            if(temp ==str(11,1))
             decimall{i}=decimall{i}+4032;
          break
            end 
          if(temp ==str(11,2))
          decimall{i}=decimall{i}+4032+1;
          break
          end
          if(temp ==str(11,3))
             decimall{i}=decimall{i}+4032+2;
          break
          end
          if(temp ==str(11,4))
           decimall{i}=decimall{i}+4032+3;
          break
          end
          if(temp ==str(11,5))
             decimall{i}=decimall{i}+4032+4;
          break
          end
          if(temp ==str(11,6))
             decimall{i}=decimall{i}+4032+5;
          break
          end
       if(temp ==str(11,7))
             decimall{i}=decimall{i}+4032+6;
          break
       end
       if(temp ==str(11,8))
             decimall{i}=decimall{i}+4032+7;
          break
                   end
                   
            
      %END OF 1
         % START OF -1
          
            if(temp =='-1; nul')
             decimall{i}=decimall{i}+3712;
          break
            end 
          if(temp =='-1; JGT')
          decimall{i}=decimall{i}+3712+1;
          break
          end
          if(temp =='-1; JEQ')
             decimall{i}=decimall{i}+3712+2;
          break
          end
          if(temp =='-1; JGE')
           decimall{i}=decimall{i}+3712+3;
          break
          end
          if(temp =='-1; JLT')
             decimall{i}=decimall{i}+3712+4;
          break
          end
          if(temp =='-1; JNE')
             decimall{i}=decimall{i}+3712+5;
          break
          end
       if(temp =='-1; JLE')
             decimall{i}=decimall{i}+3712+6;
          break
       end
       if(temp =='-1; JMP')
             decimall{i}=decimall{i}+3712+7;
          break
                   end
                   
            
      %END OF -1
         % START OF D
          
            if(temp =='D; nul')
             decimall{i}=decimall{i}+768;
          break
            end 
          if(temp =='D; JGT')
          decimall{i}=decimall{i}+768+1;
          break
          end
          if(temp =='D; JEQ')
             decimall{i}=decimall{i}+768+2;
          break
          end
          if(temp =='D; JGE')
           decimall{i}=decimall{i}+768+3;
          break
          end
          if(temp =='D; JLT')
             decimall{i}=decimall{i}+768+4;
          break
          end
          if(temp =='D; JNE')
             decimall{i}=decimall{i}+768+5;
          break
          end
       if(temp =='D; JLE')
             decimall{i}=decimall{i}+768+6;
          break
       end
       if(temp =='D; JMP')
             decimall{i}=decimall{i}+768+7;
          break
                   end
                   
            
      %END OF D
  % START OF A
          
            if(temp =='A; nul')
             decimall{i}=decimall{i}+3072;
          break
            end 
          if(temp =='A; JGT')
          decimall{i}=decimall{i}+3072+1;
          break
          end
          if(temp =='A; JEQ')
             decimall{i}=decimall{i}+3072+2;
          break
          end
          if(temp =='A; JGE')
           decimall{i}=decimall{i}+3072+3;
          break
          end
          if(temp =='A; JLT')
             decimall{i}=decimall{i}+3072+4;
          break
          end
          if(temp =='A; JNE')
             decimall{i}=decimall{i}+3072+5;
          break
          end
       if(temp =='A; JLE')
             decimall{i}=decimall{i}+3072+6;
          break
       end
       if(temp =='A; JMP')
             decimall{i}=decimall{i}+3072+7;
          break
                   end
                   
            
      %END OF A
   % START OF !D
          
            if(temp =='!D; nul')
             decimall{i}=decimall{i}+832;
          break
            end 
          if(temp =='!D; JGT')
          decimall{i}=decimall{i}+832+1;
          break
          end
          if(temp =='!D; JEQ')
             decimall{i}=decimall{i}+832+2;
          break
          end
          if(temp =='!D; JGE')
           decimall{i}=decimall{i}+832+3;
          break
          end
          if(temp =='!D; JLT')
             decimall{i}=decimall{i}+832+4;
          break
          end
          if(temp =='!D; JNE')
             decimall{i}=decimall{i}+832+5;
          break
          end
       if(temp =='!D; JLE')
             decimall{i}=decimall{i}+832+6;
          break
       end
       if(temp =='!D; JMP')
             decimall{i}=decimall{i}+832+7;
          break
                   end
                   
            
      %END OF !D
        % START OF !A
          
            if(temp =='1A; nul')
             decimall{i}=decimall{i}+3136;
          break
            end 
          if(temp =='!A; JGT')
          decimall{i}=decimall{i}+3136+1;
          break
          end
          if(temp =='!A; JEQ')
             decimall{i}=decimall{i}+3136+2;
          break
          end
          if(temp =='!A; JGE')
           decimall{i}=decimall{i}+3136+3;
          break
          end
          if(temp =='!A; JLT')
             decimall{i}=decimall{i}+3136+4;
          break
          end
          if(temp =='!A; JNE')
             decimall{i}=decimall{i}+3136+5;
          break
          end
       if(temp =='!A; JLE')
             decimall{i}=decimall{i}+3136+6;
          break
       end
       if(temp =='!A; JMP')
             decimall{i}=decimall{i}+3136+7;
          break
                   end
                   
            
      %END OF !A
          % START OF -D
          
            if(temp =='-D; nul')
             decimall{i}=decimall{i}+960;
          break
            end 
          if(temp =='-D; JGT')
          decimall{i}=decimall{i}+960+1;
          break
          end
          if(temp =='-D; JEQ')
             decimall{i}=decimall{i}+960+2;
          break
          end
          if(temp =='-D; JGE')
           decimall{i}=decimall{i}+960+3;
          break
          end
          if(temp =='-D; JLT')
             decimall{i}=decimall{i}+960+4;
          break
          end
          if(temp =='-D; JNE')
             decimall{i}=decimall{i}+960+5;
          break
          end
       if(temp =='-D; JLE')
             decimall{i}=decimall{i}+960+6;
          break
       end
       if(temp =='-D; JMP')
             decimall{i}=decimall{i}+960+7;
          break
                   end
                   
            
      %END OF -D
        % START OF -A
          
            if(temp =='-A; nul')
             decimall{i}=decimall{i}+3264;
          break
            end 
          if(temp =='-A; JGT')
          decimall{i}=decimall{i}+3264+1;
          break
          end
          if(temp =='-A; JEQ')
             decimall{i}=decimall{i}+3264+2;
          break
          end
          if(temp =='-A; JGE')
           decimall{i}=decimall{i}+3264+3;
          break
          end
          if(temp =='-A; JLT')
             decimall{i}=decimall{i}+3264+4;
          break
          end
          if(temp =='-A; JNE')
             decimall{i}=decimall{i}+3264+5;
          break
          end
       if(temp =='-A; JLE')
             decimall{i}=decimall{i}+3264+6;
          break
       end
       if(temp =='-A; JMP')
             decimall{i}=decimall{i}+3264+7;
          break
                   end
                   
            
      %END OF -A
  
       
     
     

       % START OF M
            if( temp ==str(19,1))  
            decimall{i}=decimall{i}+7168; 
          break
            end 
          if(temp ==str(19,2))
          decimall{i}=decimall{i}+7168+1;
          break
          end
          if(temp ==str(19,3))
             decimall{i}=decimall{i}+7168+2;
          break
          end
          if(temp ==str(19,4))
           decimall{i}=decimall{i}+7168+3;
          break
          end
          if(temp ==str(19,5))
             decimall{i}=decimall{i}+7168+4;
          break
          end
          if(temp ==str(19,6))
             decimall{i}=decimall{i}+7168+5;
          break
          end
       if(temp ==str(19,7))
             decimall{i}=decimall{i}+7168+6;
          break
       end
                   if(temp ==str(19,8))
             decimall{i}=decimall{i}+7168+7;
          break
                   end
                   
            
      %END OF M  

% START OF !M
            if( temp ==str(20,1))  
            decimall{i}=decimall{i}+7232; 
          break
            end 
          if(temp ==str(20,2))
          decimall{i}=decimall{i}+7232+1;
          break
          end
          if(temp ==str(20,3))
             decimall{i}=decimall{i}+7232+2;
          break
          end
          if(temp ==str(20,4))
           decimall{i}=decimall{i}+7232+3;
          break
          end
          if(temp ==str(20,5))
             decimall{i}=decimall{i}+7232+4;
          break
          end
          if(temp ==str(20,6))
             decimall{i}=decimall{i}+7232+5;
          break
          end
       if(temp ==str(20,7))
             decimall{i}=decimall{i}+7232+6;
          break
       end
                   if(temp ==str(20,8))
             decimall{i}=decimall{i}+7232+7;
          break
                   end
                   
      %END OF !M  

      % START OF -M
            if( temp ==str(21,1))  
            decimall{i}=decimall{i}+7360; 
          break
            end 
          if(temp ==str(21,2))
          decimall{i}=decimall{i}+7360+1;
          break
          end
          if(temp ==str(21,3))
             decimall{i}=decimall{i}+7360+2;
          break
          end
          if(temp ==str(21,4))
           decimall{i}=decimall{i}+7360+3;
          break
          end
          if(temp ==str(21,5))
             decimall{i}=decimall{i}+7360+4;
          break
          end
          if(temp ==str(21,6))
             decimall{i}=decimall{i}+7360+5;
          break
          end
       if(temp ==str(21,7))
             decimall{i}=decimall{i}+7360+6;
          break
       end
                   if(temp ==str(21,8))
             decimall{i}=decimall{i}+7360+7;
          break
                   end
                   
      %END OF -M 

      % START OF M+1
            if( temp ==str(22,1))  
            decimall{i}=decimall{i}+7616; 
          break
            end 
          if(temp ==str(22,2))
          decimall{i}=decimall{i}+7616+1;
          break
          end
          if(temp ==str(22,3))
             decimall{i}=decimall{i}+7616+2;
          break
          end
          if(temp ==str(22,4))
           decimall{i}=decimall{i}+7616+3;
          break
          end
          if(temp ==str(22,5))
             decimall{i}=decimall{i}+7616+4;
          break
          end
          if(temp ==str(22,6))
             decimall{i}=decimall{i}+7616+5;
          break
          end
       if(temp ==str(22,7))
             decimall{i}=decimall{i}+7616+6;
          break
       end
                   if(temp ==str(22,8))
             decimall{i}=decimall{i}+7616+7;
          break
                   end
                   
            
      %END OF M+1 

      % START OF M-1
            if( temp ==str(23,1))  
            decimall{i}=decimall{i}+7296; 
          break
            end 
          if(temp ==str(23,2))
          decimall{i}=decimall{i}+7296+1;
          break
          end
          if(temp ==str(23,3))
             decimall{i}=decimall{i}+7296+2;
          break
          end
          if(temp ==str(23,4))
           decimall{i}=decimall{i}+7296+3;
          break
          end
          if(temp ==str(23,5))
             decimall{i}=decimall{i}+7296+4;
          break
          end
          if(temp ==str(23,6))
             decimall{i}=decimall{i}+7296+5;
          break
          end
       if(temp ==str(23,7))
             decimall{i}=decimall{i}+7296+6;
          break
       end
                   if(temp ==str(23,8))
             decimall{i}=decimall{i}+7296+7;
          break
                   end
                   
            
      %END OF M-1 

         % START OF D+M
            if( temp ==str(24,1))  
            decimall{i}=decimall{i}+4224; 
          break
            end 
          if(temp ==str(24,2))
          decimall{i}=decimall{i}+4224+1;
          break
          end
          if(temp ==str(24,3))
             decimall{i}=decimall{i}+4224+2;
          break
          end
          if(temp ==str(24,4))
           decimall{i}=decimall{i}+4224+3;
          break
          end
          if(temp ==str(24,5))
             decimall{i}=decimall{i}+4224+4;
          break
          end
          if(temp ==str(24,6))
             decimall{i}=decimall{i}+4224+5;
          break
          end
       if(temp ==str(24,7))
             decimall{i}=decimall{i}+4224+6;
          break
       end
                   if(temp ==str(24,8))
             decimall{i}=decimall{i}+4224+7;
          break
                   end
                   
            
      %END OF D+M

       % START OF D-M
            if( temp ==str(25,1))  
            decimall{i}=decimall{i}+5312; 
          break
            end 
          if(temp ==str(25,2))
          decimall{i}=decimall{i}+5312+1;
          break
          end
          if(temp ==str(25,3))
             decimall{i}=decimall{i}+5312+2;
          break
          end
          if(temp ==str(25,4))
           decimall{i}=decimall{i}+5312+3;
          break
          end
          if(temp ==str(25,5))
             decimall{i}=decimall{i}+5312+4;
          break
          end
          if(temp ==str(25,6))
             decimall{i}=decimall{i}+5312+5;
          break
          end
       if(temp ==str(25,7))
             decimall{i}=decimall{i}+5312+6;
          break
       end
                   if(temp ==str(25,8))
             decimall{i}=decimall{i}+5312+7;
          break
                   end
                   
            
      %END OF D-M

         % START OF M-D
            if( temp ==str(26,1))  
            decimall{i}=decimall{i}+4544; 
          break
            end 
          if(temp ==str(26,2))
          decimall{i}=decimall{i}+4544+1;
          break
          end
          if(temp ==str(26,3))
             decimall{i}=decimall{i}+4544+2;
          break
          end
          if(temp ==str(26,4))
           decimall{i}=decimall{i}+4544+3;
          break
          end
          if(temp ==str(26,5))
             decimall{i}=decimall{i}+4544+4;
          break
          end
          if(temp ==str(26,6))
             decimall{i}=decimall{i}+4544+5;
          break
          end
       if(temp ==str(26,7))
             decimall{i}=decimall{i}+4544+6;
          break
       end
                   if(temp ==str(26,8))
             decimall{i}=decimall{i}+4544+7;
          break
                   end
                   
            
      %END OF M-D

       % START OF D&M
            if( temp ==str(27,1))  
            decimall{i}=decimall{i}+4096; 
          break
            end 
          if(temp ==str(27,2))
          decimall{i}=decimall{i}+4096+1;
          break
          end
          if(temp ==str(27,3))
             decimall{i}=decimall{i}+4096+2;
          break
          end
          if(temp ==str(27,4))
           decimall{i}=decimall{i}+4096+3;
          break
          end
          if(temp ==str(27,5))
             decimall{i}=decimall{i}+4096+4;
          break
          end
          if(temp ==str(27,6))
             decimall{i}=decimall{i}+4096+5;
          break
          end
       if(temp ==str(27,7))
             decimall{i}=decimall{i}+4096+6;
          break
       end
                   if(temp ==str(27,8))
             decimall{i}=decimall{i}+4096+7;
          break
                   end
                   
            
      %END OF D&M

          % START OF D|M
            if( temp ==str(28,1))  
            decimall{i}=decimall{i}+5440; 
          break
            end 
          if(temp ==str(28,2))
          decimall{i}=decimall{i}+5440+1;
          break
          end
          if(temp ==str(28,3))
             decimall{i}=decimall{i}+5440+2;
          break
          end
          if(temp ==str(28,4))
           decimall{i}=decimall{i}+5440+3;
          break
          end
          if(temp ==str(28,5))
             decimall{i}=decimall{i}+5440+4;
          break
          end
          if(temp ==str(28,6))
             decimall{i}=decimall{i}+5440+5;
          break
          end
       if(temp ==str(28,7))
             decimall{i}=decimall{i}+5440+6;
          break
       end
                   if(temp ==str(28,8))
             decimall{i}=decimall{i}+5440+7;
          break
                   end
                   
            
      %END OF D|M
       
    end
                         binary_array{i,1} = dec2bin(decimall{i},16)

        
    end
