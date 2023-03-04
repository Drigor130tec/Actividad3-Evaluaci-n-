function [Jv_a, Jw_a] = calculo_analitico_Jacobianos(PO, RO, RP, GDL)
    Jv_a(:,GDL) = PO(:,:,GDL);
    Jw_a(:,GDL) = PO(:,:,GDL);

    for k= 1:GDL
        if RP(k)==0 
           %Para las juntas de revolución
            try
                Jv_a(:,k)= cross(RO(:,3,k-1), PO(:,:,GDL)-PO(:,:,k-1));
                Jw_a(:,k)= RO(:,3,k-1);
            catch
                Jv_a(:,k)= cross([0,0,1], PO(:,:,GDL));
                Jw_a(:,k)=[0,0,1];
            end
        else
            %Para las juntas prismáticas
            try
                Jv_a(:,k)= RO(:,3,k-1);
            catch
                Jv_a(:,k)=[0,0,1];
            end
                Jw_a(:,k)=[0,0,0];
        end
    end
end