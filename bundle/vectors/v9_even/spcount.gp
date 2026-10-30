default(nbthreads, 1);
print("nbthreads = ", default(nbthreads));
print("exact count of principal stabiliser S_P = {x in (O/NO)^* : diag(1, N(x))^-1 g_x in S'} (R1 diamond rule), by m mod 2N");
SH = [[1,0;0,1], [1,0;4,1], [1,4;0,1], [1,4;4,1], [7,0;0,7], [7,0;4,7], [7,4;0,7], [7,4;4,7]];
SG = [[1,0;0,1], [1,0;3,1], [5,0;0,5], [5,0;3,5]];
inS(M, S, N) = { my(R = apply(e -> e % N, M)); for(i = 1, #S, if(R == S[i], return(1))); 0; }
cnt(m, N, S) = {
  my(U = 0, F = 0, nx, g);
  for(t = 0, N-1, for(s = 0, N-1, nx = t^2 + m*s^2; if(gcd(nx, N) == 1, U++;
    g = [1, 0; 0, lift(Mod(nx, N)^-1)] * [t, -m*s; s, t];
    if(inS(g, S, N), F++))));
  [U, F, U/F];
}
{
  for(r = 0, 15, print("GG level 8, m = ", r, " mod 16: [|W|, |S_P|, |W|/|S_P|] = ", cnt(r, 8, SH)));
  for(r = 0, 11, print("CF level 6, m = ", r, " mod 12: [|W|, |S_P|, |W|/|S_P|] = ", cnt(r, 6, SG)));
}
