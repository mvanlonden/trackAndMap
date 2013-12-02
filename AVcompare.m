function [output]=AVcompare(position,wav)
INDEX=[]


for i=1:1000:length(wav)
    if wav(i,2)~=0
        INDEX1=wav(i,1)>=position(:,1)+0.0005
        INDEX2=wav(i,1)<=position(:,1)-0.0005
        INDEX=(INDEX1==INDEX2)
        if ~isempty(INDEX)
            plot(position(INDEX,2),position(INDEX,3),'ro', 'MarkerSize', 10)
        end
    end
end
hold off;
return