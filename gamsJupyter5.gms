$offeolcom
$eolcom #
option limrow=0, limcol=0;
option solprint=off;

variables
    a(dim) "a component of plane equation ax+d=0",
    d "d component of plane equation ax+d=0",
    loss "objective",
    loss_term(obs) "loss over one specific observation";
    
equations
    loss_fn "overall loss function (objective is to minimize)",
    def_loss_term(obs) "define one loss term at a time"
    a_unit "constrain a to be unit length";
    
loss_fn..
    loss =e= sum(obs, sqr(loss_term(obs)));

def_loss_term(obs)..
    loss_term(obs) =e=
        p("x") * (a("x")*big_A(obs, "Aa") + a("y")*big_A(obs, "Ad") + a("z")*big_A(obs, "Ag"))
        + p("y") * (a("x")*big_A(obs, "Ab") + a("y")*big_A(obs, "Ae") + a("z")*big_A(obs, "Ah"))
        + p("z") * (a("x")*big_A(obs, "Ac") + a("y")*big_A(obs, "Af") + a("z")*big_A(obs, "Ai"))
        + m(obs) * u("x") * (a("x")*big_A(obs, "Aa") + a("y")*big_A(obs, "Ad") + a("z")*big_A(obs, "Ag"))
        + m(obs) * u("y") * (a("x")*big_A(obs, "Ab") + a("y")*big_A(obs, "Ae") + a("z")*big_A(obs, "Ah"))
        + m(obs) * u("z") * (a("x")*big_A(obs, "Ac") + a("y")*big_A(obs, "Af") + a("z")*big_A(obs, "Ai"))
        + d
        + sum(dim, a(dim)*t(obs, dim));

a_unit..
    sum(dim, sqr(a(dim))) =e= 1;
    
a.l(dim) = sqrt(1/3);

model lstsq /loss_fn, def_loss_term, a_unit/;
solve lstsq using qcp minimizing loss;
