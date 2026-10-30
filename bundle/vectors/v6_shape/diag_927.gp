/* diag_927.gp: the two POST HOC (9, 27) diagnosis scripts as run on 2026-10-28 (scratch diag.gp then diag2.gp), copied verbatim. */
/* NOTE (v2): run WITHOUT default(nbthreads, 1); gp default was 12. */
/* ---- diag.gp ---- */
read("vectors/vG_level/gl.gp");
default(realprecision, 150);
t = I*sqrt(27); l = 9;
Vd = Bv(l,1,t)*Bv(l,2,t)*Bv(l,4,t);
R = 2^(36-9)*(real(weber(t/9))/real(weber(t/3)))^9*real(weber(t))^(-54);
print("direct V' vs closed: ", abs(Vd-R)/abs(R));
P = cmpointsc(-108, 36, 1); v = vector(#P, i, if(P[i][1][1]==1, Bv(l,1,P[i][2]), 0));
w = select(x->x!=0, v); print(#w, " principal values; min/max rel spread to B_1,B_2,B_4:");
B = [Bv(l,1,t), Bv(l,2,t), Bv(l,4,t)];
print(vecmax(vector(#w, i, vecmin(vector(3, j, abs(w[i]-B[j])/abs(B[j]))))));
print(vector(3,j,B[j]));
/* ---- diag2.gp ---- */
read("vectors/vG_level/gl.gp");
read("vectors/v6_shape/clustfix.gp");
default(realprecision, 150);
l = 9; m = 27; D = -4*m; N = 36; F = redforms(D); C = cosetcols(N); t = I*sqrt(m);
B = [Bv(l,1,t), Bv(l,2,t), Bv(l,4,t)];
Lv = List(); Pts = List();
for(k = 1, #C, my(Q = classform(F[1], C[k], N)); if(Q != 0, my(a = Q[1], b = Q[2], ap = lift(Mod(a, N)^-1), x = (-ap * b / 2) % N, z0 = x + (b + sqrt(D)) / (2 * a)); listput(Lv, Bv(l, 1, z0)); listput(Pts, [a, b, imag(z0)])));
err = vector(#Lv, i, vecmin(vector(3, j, abs(Lv[i]-B[j])/abs(B[j]))));
print("F[1]=", F[1], " #values=", #Lv, " max err to B_k = ", vecmax(err));
c = pclust(Vec(Lv)); print("pclust: ", #c[1], " reps, mult ", c[2], " spread ", c[3], " ok ", c[5]);
print("reps vs B: ", vector(#c[1], i, vecmin(vector(3, j, abs(c[1][i]-B[j])/abs(B[j])))));
