function plotRectangles(rectangles,labels,colors)
    if(nargin<2)
        labels=[];
    end
    if(nargin<3)
        colors = rand(size(rectangles,2),3).^0.5;
    end    
   \
    for i= 1:size(rectangles,2)
        r = rectangles(:,i);
        xPoints= [r(1), r(1), r(1) + r(3),r(1) + r(3)];
        yPoints= [r(2), r(2)+ r(4), r(2)+ r(4),r(2)];
        patch(xPoints,yPoints,colors(i,:),'EdgeColor','none');
        if(~isempty(labels))
            text(r(1) + r(3)/2,r(2) + r(4)/2, 1, labels{i}, 'VerticalAlignment','middle','HorizontalAlignment','center')
        end
    end
axis equal
axis tight
axis off
end