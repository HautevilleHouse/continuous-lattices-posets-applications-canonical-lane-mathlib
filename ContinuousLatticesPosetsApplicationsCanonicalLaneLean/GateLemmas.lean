import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsCanonicalLaneLean

/-- The gate records the admissible class endpoint as satisfied by the continuous lattice structure. -/
def gateClosed (A : AdmissibleClass) : Prop := A.endpointSatisfied

theorem continuous_lattice_gate_closed (A : AdmissibleClass) (h : A.endpointSatisfied) : gateClosed A := h

end ContinuousLatticesPosetsApplicationsCanonicalLaneLean
end HautevilleHouse