clear; clc;

prompt={'\sigma_x','\sigma_y','\tau_{xy}','\theta'};
name='Input for Peaks function';
numlines=1;
defaultanswer={'80','40','-30','45'};
options.Resize='on';
options.WindowStyle='normal';
options.Interpreter='tex';
answer=inputdlg(prompt,name,numlines,defaultanswer,options);

sigma_x = str2double(answer(1));
sigma_y = str2double(answer(2));
tau_xy = str2double(answer(3));
theta = deg2rad(str2double(answer(4)));

tcl = tiledlayout(6,5,"TileSpacing", "compact");
nexttile(tcl,[6 3])

R = sqrt(((sigma_x - sigma_y)/2)^2 + tau_xy^2);
C = (sigma_x + sigma_y)/2;
sig1 = C+R;
sig2 = C-R;

alpha = atan(2*(tau_xy)/(sigma_x - sigma_y))/2.0;

sigma_x1 = C + R*cos(2*alpha - 2*theta);
sigma_y1 = C - R*cos(2*alpha - 2*theta);
tau_x1y1 = R*sin(2*alpha - 2*theta);

sigma = linspace(sig2, sig1, 1001);
tau1 = sqrt(R^2 - (sigma-C).^2);
tau2 = -tau1;

plot(sigma, tau1, 'k', sigma, tau2, 'k')
xlabel('σ (Normal Stress) (MPa)', 'FontSize',20)
ylabel('𝜏 (Shear Stress) (MPa)', 'FontSize',20)

axis('square')
title('Mohr''s Circle', 'FontSize',20);

hold on

text(C, 0,sprintf('  C(%.2f, %.2f)  ',C, 0), 'VerticalAlignment','bottom','FontSize',15)
text(sig1, 0,sprintf('  σ_m_a_x(%.2f, %.2f)  ',sig1, 0), 'HorizontalAlignment','left','FontSize',15)
text(sig2, 0,sprintf('  σ_m_i_n(%.2f, %.2f)  ',sig2, 0), 'HorizontalAlignment','right','FontSize',15)
text(C, R,sprintf('  𝜏_m_a_x(%.2f, %.2f)  ',C, R), 'HorizontalAlignment','left', 'VerticalAlignment', 'bottom', 'FontSize',15)
text(C, -R,sprintf('  𝜏_m_a_x(%.2f, %.2f)  ',C, -R), 'HorizontalAlignment','left','VerticalAlignment', 'top','FontSize',15)
%text(sigma_x, -tau_xy,sprintf('  σ_x(%g, %g)  ',sigma_x, -tau_xy), 'HorizontalAlignment','left','FontSize',15)
%text(sigma_y, tau_xy,sprintf('  σ_y(%g, %g)  ',sigma_y, tau_xy), 'HorizontalAlignment','left','FontSize',15)

if(sigma_x > C)
    if(tau_xy >0)
        text(sigma_x, -tau_xy,sprintf('  σ_x(%.2f, %.2f)  ',sigma_x, -tau_xy), 'HorizontalAlignment','left', 'VerticalAlignment', 'top','FontSize',15)
    else
        text(sigma_x, -tau_xy,sprintf('  σ_x(%.2f, %.2f)  ',sigma_x, -tau_xy), 'HorizontalAlignment','left', 'VerticalAlignment', 'bottom','FontSize',15)
    end
else
    if(tau_xy > 0)
        text(sigma_x, -tau_xy,sprintf('  σ_x(%.2f, %.2f)  ',sigma_x, -tau_xy), 'HorizontalAlignment','right', 'VerticalAlignment', 'top','FontSize',15)
    else
        text(sigma_x, -tau_xy,sprintf('  σ_x(%.2f, %.2f)  ',sigma_x, -tau_xy), 'HorizontalAlignment','right', 'VerticalAlignment', 'bottom','FontSize',15)
    end
end
if(sigma_y > C)
    if(tau_xy >0)
        text(sigma_y, tau_xy,sprintf('  σ_y(%.2f, %.2f)  ',sigma_y, tau_xy), 'HorizontalAlignment','left', 'VerticalAlignment', 'bottom','FontSize',15)
    else
        text(sigma_y, tau_xy,sprintf('  σ_y(%.2f, %.2f)  ',sigma_y, tau_xy), 'HorizontalAlignment','left', 'VerticalAlignment', 'top','FontSize',15)
    end
else
    if(tau_xy > 0)
        text(sigma_y, tau_xy,sprintf('  σ_y(%.2f, %.2f)  ',sigma_y, tau_xy), 'HorizontalAlignment','right', 'VerticalAlignment', 'bottom','FontSize',15)
    else
        text(sigma_y, tau_xy,sprintf('  σ_y(%.2f, %.2f)  ',sigma_y, tau_xy), 'HorizontalAlignment','right', 'VerticalAlignment', 'top','FontSize',15)
    end
end

if(sigma_x1 > C)
    if(tau_x1y1 >0)
        text(sigma_x1, -tau_x1y1,sprintf('  σ_x_1(%.2f, %.2f)  ',sigma_x1, -tau_x1y1), 'HorizontalAlignment','left', 'VerticalAlignment', 'top','FontSize',15)
    else
        text(sigma_x1, -tau_x1y1,sprintf('  σ_x_1(%.2f, %.2f)  ',sigma_x1, -tau_x1y1), 'HorizontalAlignment','left', 'VerticalAlignment', 'bottom','FontSize',15)
    end
else
    if(tau_x1y1 > 0)
        text(sigma_x1, -tau_x1y1,sprintf('  σ_x_1(%.2f, %.2f)  ',sigma_x1, -tau_x1y1), 'HorizontalAlignment','right', 'VerticalAlignment', 'top','FontSize',15)
    else
        text(sigma_x1, -tau_x1y1,sprintf('  σ_x_1(%.2f, %.2f)  ',sigma_x1, -tau_x1y1), 'HorizontalAlignment','right', 'VerticalAlignment', 'bottom','FontSize',15)
    end
end
if(sigma_y1 > C)
    if(tau_x1y1 >0)
        text(sigma_y1, tau_x1y1,sprintf('  σ_y_1(%.2f, %.2f)  ',sigma_y1, tau_x1y1), 'HorizontalAlignment','left', 'VerticalAlignment', 'bottom','FontSize',15)
    else
        text(sigma_y1, tau_x1y1,sprintf('  σ_y_1(%.2f, %.2f)  ',sigma_y1, tau_x1y1), 'HorizontalAlignment','left', 'VerticalAlignment', 'top','FontSize',15)
    end
else
    if(tau_x1y1 > 0)
        text(sigma_y1, tau_x1y1,sprintf('  σ_y_1(%.2f, %.2f)  ',sigma_y1, tau_x1y1), 'HorizontalAlignment','right', 'VerticalAlignment', 'bottom','FontSize',15)
    else
        text(sigma_y1, tau_x1y1,sprintf('  σ_y_1(%.2f, %.2f)  ',sigma_y1, tau_x1y1), 'HorizontalAlignment','right', 'VerticalAlignment', 'top','FontSize',15)
    end
end

plot(C,0, 'ko', 'MarkerFaceColor','red')
plot([sig1, sig2], [0,0], 'ko','MarkerFaceColor','g')
plot([C, C], [R,-R], 'ko','MarkerFaceColor','r')
%plot([sig1, sig2], [0,0], 'k')
plot([sigma_x, sigma_y], [-tau_xy, tau_xy], 'ko','MarkerFaceColor','b')
plot([sigma_x, sigma_y], [-tau_xy, tau_xy],'r','LineStyle','--')

plot([sigma_x1, sigma_y1], [-tau_x1y1, tau_x1y1], 'ko','MarkerFaceColor','b')
plot([sigma_x1, sigma_y1], [-tau_x1y1, tau_x1y1],'r')
grid on

x = [0.1, 0.9, 0.9, 0.1, 0.1];
y = [0.1, 0.1, 0.9, 0.9, 0.1];

nexttile(tcl, [3 2])

hold on
axis('equal')

quiver(0.5,0.5,0.25,0,"Color",'g')
quiver(0.5,0.5,0,0.25,"Color",'magenta')
text(0.75,0.5,'  x  ', 'HorizontalAlignment','left', 'VerticalAlignment','top','FontSize',10)
text(0.5,0.75,'  y  ', 'VerticalAlignment','bottom','HorizontalAlignment','right','FontSize',10)
plot(0.5,0.5, 'ko','MarkerFaceColor','r')
title('Initial State of Stress', 'FontSize',20)

if(tau_xy < 0)
    quiver(1,1,0,-1,"Color",'r','LineWidth',1)
    quiver(1,1,-1,0,"Color",'r','LineWidth',1)
    text(0, 1,sprintf('  %.2f MPa  ', -tau_xy), 'HorizontalAlignment','right', 'VerticalAlignment', 'bottom', 'FontSize',10)
    quiver(0,0,1,0,"Color",'r','LineWidth',1)
    quiver(0,0,0,1,"Color",'r','LineWidth',1)
    text(1, 0,sprintf('  %.2f MPa  ', -tau_xy), 'HorizontalAlignment','left', 'VerticalAlignment', 'top', 'FontSize',10)
elseif(tau_xy > 0)
    quiver(1,0,0,1,"Color",'r','LineWidth',1)
    quiver(0,1,1,0,"Color",'r','LineWidth',1)
    text(1, 1,sprintf('  %.2f MPa  ', tau_xy), 'HorizontalAlignment','left', 'VerticalAlignment', 'bottom', 'FontSize',10)
    quiver(1,0,-1,0,"Color",'r','LineWidth',1)
    quiver(0,1,0,-1,"Color",'r','LineWidth',1)
    text(0, 0,sprintf('  %.2f MPa  ', tau_xy), 'HorizontalAlignment','right', 'VerticalAlignment', 'top', 'FontSize',10)
end

if( sigma_x > 0)
    quiver(1,0.5,1,0,"Color",'b','LineWidth',1)
    text(2, 0.5,sprintf('  %.2f MPa  ', sigma_x), 'HorizontalAlignment','left', 'VerticalAlignment', 'bottom', 'FontSize',10)
    quiver(0,0.5,-1,0,"Color",'b','LineWidth',1)
    text(-1, 0.5,sprintf('  %.2f MPa  ', sigma_x), 'HorizontalAlignment','right', 'VerticalAlignment', 'bottom', 'FontSize',10)
elseif(sigma_x < 0)
    quiver(2,0.5,-1,0,"Color",'b','LineWidth',1)
    text(1, 0.5,sprintf('  %.2f MPa  ', -sigma_x), 'HorizontalAlignment','left', 'VerticalAlignment', 'bottom', 'FontSize',10)
    quiver(-1,0.5,1,0,"Color",'b','LineWidth',1)
    text(0, 0.5,sprintf('  %.2f MPa  ', -sigma_x), 'HorizontalAlignment','right', 'VerticalAlignment', 'bottom', 'FontSize',10)
end

if(sigma_y > 0)
    quiver(0.5,1,0,1,"Color",'b','LineWidth',1)
    text(0.5, 2,sprintf('  %.2f MPa  ', sigma_y), 'HorizontalAlignment','left', 'VerticalAlignment', 'bottom', 'FontSize',10)
    quiver(0.5,0,0,-1,"Color",'b','LineWidth',1)
    text(0.5, -1,sprintf('  %.2f MPa  ', sigma_y), 'HorizontalAlignment','left', 'VerticalAlignment', 'top', 'FontSize',10)
elseif(sigma_y < 0)
    quiver(0.5,2,0,-1,"Color",'b','LineWidth',1)
    text(0.5, 1,sprintf('  %.2f MPa  ', -sigma_y), 'HorizontalAlignment','left', 'VerticalAlignment', 'bottom', 'FontSize',10)
    quiver(0.5,-1,0,1,"Color",'b','LineWidth',1)
    text(0.5, 0,sprintf('  %.2f MPa  ', -sigma_y), 'HorizontalAlignment','right', 'VerticalAlignment', 'top', 'FontSize',10)
end

plot(x, y, 'k', 'LineWidth', 2)

nexttile(tcl, [3 2])

hold on

plot(0,0, 'ko','MarkerFaceColor','r')
axis('equal')
quiver(0,0,0.5*cos(theta),0.5*sin(theta),"Color",'g')
quiver(0,0,-0.5*sin(theta),0.5*cos(theta),"Color",'magenta')
quiver(0,0,0.5,0,"Color",'g','LineStyle','--')
quiver(0,0,0,0.5,"Color",'magenta','LineStyle','--')

text(0.5*cos(theta),0.5*sin(theta),'  x_1  ', 'HorizontalAlignment','left', 'VerticalAlignment','top','FontSize',10)
text(-0.5*sin(theta),0.5*cos(theta),'  y_1  ', 'VerticalAlignment','bottom','HorizontalAlignment','right','FontSize',10)
text(0.5,0,'  x  ', 'HorizontalAlignment','left', 'VerticalAlignment','top','FontSize',10)
text(0,0.5,'  y  ', 'VerticalAlignment','bottom','HorizontalAlignment','right','FontSize',10)

x = [0.7,-0.7,-0.7,0.7, 0.7];
y = [0.7,0.7,-0.7,-0.7,0.7];
plot(x, y, 'k', 'LineWidth', 1,'LineStyle','--','Color','k')

x = [cos(theta+pi/4),cos(theta+3*pi/4),cos(theta+5*pi/4),cos(theta+7*pi/4),cos(theta+pi/4)];
y = [sin(theta+pi/4),sin(theta+3*pi/4),sin(theta+5*pi/4),sin(theta+7*pi/4),sin(theta+pi/4)];
plot(x, y, 'k', 'LineWidth', 2)

if(tau_x1y1 < 0)
    quiver(1.2*cos(theta+pi/4),1.2*sin(theta+pi/4),1.2*sqrt(2)*sin(theta),-1.2*sqrt(2)*cos(theta),"Color",'r','LineWidth',1);
    quiver(1.2*cos(theta+pi/4),1.2*sin(theta+pi/4),-1.2*sqrt(2)*cos(theta),-1.2*sqrt(2)*sin(theta),"Color",'r','LineWidth',1)
    text(1.2*cos(theta+pi/4)+1.2*sqrt(2)*sin(theta), 1.2*sin(theta+pi/4)+-1.2*sqrt(2)*cos(theta),sprintf('  %.2f MPa  ', -tau_x1y1), 'HorizontalAlignment','left', 'VerticalAlignment', 'bottom', 'FontSize',10)
    quiver(1.2*cos(theta+5*pi/4),1.2*sin(theta+5*pi/4),-1.2*sqrt(2)*sin(theta),1.2*sqrt(2)*cos(theta),"Color",'r','LineWidth',1)
    quiver(1.2*cos(theta+5*pi/4),1.2*sin(theta+5*pi/4),1.2*sqrt(2)*cos(theta),1.2*sqrt(2)*sin(theta),"Color",'r','LineWidth',1)
    text(1.2*cos(theta+5*pi/4)+-1.2*sqrt(2)*sin(theta), 1.2*sin(theta+5*pi/4)+1.2*sqrt(2)*cos(theta),sprintf('  %.2f MPa  ', -tau_x1y1), 'HorizontalAlignment','right', 'VerticalAlignment', 'top', 'FontSize',10)
elseif(tau_x1y1 > 0)
    quiver(1.2*cos(theta+7*pi/4),1.2*sin(theta+7*pi/4),-1.2*sqrt(2)*sin(theta),1.2*sqrt(2)*cos(theta),"Color",'r','LineWidth',1)
    quiver(1.2*cos(theta+7*pi/4),1.2*sin(theta+7*pi/4),-1.2*sqrt(2)*cos(theta),-1.2*sqrt(2)*sin(theta),"Color",'r','LineWidth',1)
    text(1.2*cos(theta+7*pi/4)+-1.2*sqrt(2)*sin(theta), 1.2*sin(theta+7*pi/4)+1.2*sqrt(2)*cos(theta),sprintf('  %.2f MPa  ', tau_x1y1), 'HorizontalAlignment','right', 'VerticalAlignment', 'bottom', 'FontSize',10)
    quiver(1.2*cos(theta+3*pi/4),1.2*sin(theta+3*pi/4),1.2*sqrt(2)*sin(theta),-1.2*sqrt(2)*cos(theta),"Color",'r','LineWidth',1)
    quiver(1.2*cos(theta+3*pi/4),1.2*sin(theta+3*pi/4),1.2*sqrt(2)*cos(theta),1.2*sqrt(2)*sin(theta),"Color",'r','LineWidth',1)
    text(1.2*cos(theta+3*pi/4)+1.2*sqrt(2)*sin(theta), 1.2*sin(theta+3*pi/4)+-1.2*sqrt(2)*cos(theta),sprintf('  %.2f MPa  ', tau_x1y1), 'HorizontalAlignment','left', 'VerticalAlignment', 'top', 'FontSize',10)
end

if( sigma_x1 > 0)
    quiver(cos(theta),sin(theta),sqrt(2)*cos(theta),sqrt(2)*sin(theta),"Color",'b','LineWidth',1)
    text(cos(theta)+sqrt(2)*cos(theta), sin(theta)+sqrt(2)*sin(theta),sprintf('  %.2f MPa  ', sigma_x1), 'HorizontalAlignment','left', 'VerticalAlignment', 'bottom', 'FontSize',10)
    quiver(-cos(theta),-sin(theta),-sqrt(2)*cos(theta),-sqrt(2)*sin(theta),"Color",'b','LineWidth',1)
    text(-cos(theta)+-sqrt(2)*cos(theta), -sin(theta)+-sqrt(2)*sin(theta),sprintf('  %.2f MPa  ', sigma_x1), 'HorizontalAlignment','right', 'VerticalAlignment', 'bottom', 'FontSize',10)
elseif(sigma_x1 < 0)
    quiver(2*cos(theta),2*sin(theta),-sqrt(2)*cos(theta),-sqrt(2)*sin(theta),"Color",'b','LineWidth',1)
    text(2*cos(theta), 2*sin(theta),sprintf('  %.2f MPa  ', -sigma_x1), 'HorizontalAlignment','left', 'VerticalAlignment', 'bottom', 'FontSize',10)
    quiver(-2*cos(theta),-2*sin(theta),sqrt(2)*cos(theta),sqrt(2)*sin(theta),"Color",'b','LineWidth',1)
    text(-2*cos(theta), -2*sin(theta),sprintf('  %.2f MPa  ', -sigma_x1), 'HorizontalAlignment','right', 'VerticalAlignment', 'bottom', 'FontSize',10)
end

if(sigma_y1 > 0)
    quiver(-sin(theta),cos(theta),-sqrt(2)*sin(theta),sqrt(2)*cos(theta),"Color",'b','LineWidth',1)
    text(-sin(theta)+-sqrt(2)*sin(theta), cos(theta)+sqrt(2)*cos(theta),sprintf('  %.2f MPa  ', sigma_y1), 'HorizontalAlignment','left', 'VerticalAlignment', 'bottom', 'FontSize',10)
    quiver(sin(theta),-cos(theta),sqrt(2)*sin(theta),-sqrt(2)*cos(theta),"Color",'b','LineWidth',1)
    text(sin(theta)+sqrt(2)*sin(theta),-cos(theta)+-sqrt(2)*cos(theta),sprintf('  %.2f MPa  ', sigma_y1), 'HorizontalAlignment','left', 'VerticalAlignment', 'top', 'FontSize',10)
elseif(sigma_y1 < 0)
    quiver(-2*sin(theta),2*cos(theta),sqrt(2)*sin(theta),-sqrt(2)*cos(theta),"Color",'b','LineWidth',1)
    text(-2*sin(theta), 2*cos(theta),sprintf('  %.2f MPa  ', -sigma_y1), 'HorizontalAlignment','left', 'VerticalAlignment', 'bottom', 'FontSize',10)
    quiver(2*sin(theta),-2*cos(theta),-sqrt(2)*sin(theta),sqrt(2)*cos(theta),"Color",'b','LineWidth',1)
    text(2*sin(theta), -2*cos(theta),sprintf('  %.2f MPa  ', -sigma_y1), 'HorizontalAlignment','right', 'VerticalAlignment', 'top', 'FontSize',10)
end

title('Final state of Stress', 'FontSize',20)
