import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsCanonicalLaneLean

structure PosetDomain where
  carrier : Type u
  le : carrier → carrier → Prop
  le_refl : ∀ x : carrier, le x x
  le_trans : ∀ x y z : carrier, le x y → le y z → le x z
  le_antisymm : ∀ x y : carrier, le x y → le y x → x = y
  directed_complete : ∀ (D : Set carrier) (hD : DirectedOn (fun a b => le a b) D), ∃ x, IsLUB D x

theorem poset_domain_complete (P : PosetDomain) : CompleteLattice P.carrier := by
  exact AdmissibleClass.posetDomainCompleteLattice P

end ContinuousLatticesPosetsApplicationsCanonicalLaneLean
end HautevilleHouse