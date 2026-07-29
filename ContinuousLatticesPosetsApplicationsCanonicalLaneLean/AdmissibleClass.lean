import ContinuousLatticesPosetsApplicationsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsCanonicalLaneLean

structure AdmissibleClass where
  object : ContinuousLatticeAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ContinuousLatticeWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ContinuousLatticesPosetsApplicationsCanonicalLaneLean
end HautevilleHouse