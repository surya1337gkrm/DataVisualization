function plotRectangles2(rectangles,labels)

    
        colors = rand(size(rectangles,2),3).^0.5;

   
    for i= 1:size(rectangles,2)
        r = rectangles(:,i);
        xPoints= [r(1), r(1), r(1) + r(3),r(1) + r(3)];
        yPoints= [r(2), r(2)+ r(4), r(2)+ r(4),r(2)];
        patch(xPoints,yPoints,colors(i,:),'EdgeColor','none');
        if(~isempty(labels))      
            text(r(1) ,r(2) + r(4), 1, labels{i}, 'VerticalAlignment','cap','HorizontalAlignment','left', ...
                'color','white','BackgroundColor','#a5a5a5');
        end
    end
    
axis equal
axis tight
axis off
end