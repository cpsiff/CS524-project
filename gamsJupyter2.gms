$offeolcom
$eolcom #
sets
    dim "3D coordinate / vector dimensions",
    obs "set of observations",
    mat "entry names for a 3x3 matrix";

parameters
    m(obs) "(m)easurement observed per observation",
    big_A(obs, mat) "affine transform matrix for robot motion for the given observation",
    t(obs, dim) "translation component of robot motion for the given observation"
    p(dim) "position of sensor on robot",
    u(dim) "heading vector denoting the orientation of the sensor on the robot";
