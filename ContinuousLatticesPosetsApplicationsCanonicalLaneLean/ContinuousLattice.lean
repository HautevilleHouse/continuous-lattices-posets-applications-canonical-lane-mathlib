import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsCanonicalLaneLean

/-- A complete lattice where every directed set has a supremum and the meet operation distributes over directed suprema. -/
structure ContinuousLattice where
  carrier : Type u
  le : carrier → carrier → Prop
  sup : Set carrier → carrier
  inf : carrier → carrier → carrier
  top : carrier
  bot : carrier
  le_refl : ∀ x : carrier, le x x
  le_trans : ∀ x y z : carrier, le x y → le y z → le x z
  le_antisymm : ∀ x y : carrier, le x y → le y x → x = y
  sup_is_lub : ∀ s : Set carrier, IsLUB s (sup s)
  inf_is_glb : ∀ x y : carrier, IsGLB {x, y} (inf x y)
  top_greatest : ∀ x : carrier, le x top
  bot_least : ∀ x : carrier, le bot x
  directed_sup_distributive : ∀ (D : Set carrier) (hD : DirectedOn (fun a b => le a b) D) (x : carrier),
    inf x (sup D) = sup (inf x '' D)

theorem closed_under_directed_sups (L : ContinuousLattice) (D : Set L.carrier) (hD : DirectedOn (fun a b => L.le a b) D) :
    IsLUB D (L.sup D) := L.sup_is_lub D

end ContinuousLatticesPosetsApplicationsCanonicalLaneLean
end HautevilleHouse