import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsCanonicalLaneLean

def ConstrainedContinuousLatticeClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_continuous_lattice_endgame (A : AdmissibleClass) : ConstrainedContinuousLatticeClosure A := by
  exact And.intro (by trivial) (A.gateWitness)

end ContinuousLatticesPosetsApplicationsCanonicalLaneLean
end HautevilleHouse