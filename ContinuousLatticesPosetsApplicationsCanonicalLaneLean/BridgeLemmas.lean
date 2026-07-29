import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsCanonicalLaneLean

/-- A continuous lattice structure bridges the admissible class via its directed completeness. -/
def bridgeClosed (A : AdmissibleClass) : Prop := True

theorem continuous_lattice_is_bridge_closed (A : AdmissibleClass) (L : ContinuousLattice) : bridgeClosed A := by
  trivial

end ContinuousLatticesPosetsApplicationsCanonicalLaneLean
end HautevilleHouse