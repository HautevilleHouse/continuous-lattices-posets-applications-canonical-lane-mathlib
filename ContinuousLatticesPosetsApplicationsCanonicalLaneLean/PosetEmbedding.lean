import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousLatticesPosetsApplicationsCanonicalLaneLean.ContinuousLattice

namespace HautevilleHouse
namespace ContinuousLatticesPosetsApplicationsCanonicalLaneLean

structure PosetEmbedding (P Q : Type u) [Preorder P] [Preorder Q] where
  toFun : P → Q
  monotone : ∀ a b, a ≤ b → toFun a ≤ toFun b
  preservesWayBelow : ∀ a b, a ≪ b → toFun a ≪ toFun b
  preservesDirectedSup : ∀ (s : Set P), DirectedOn (· ≤ ·) s → toFun (sup₀ s) = sup₀ (toFun '' s)

theorem embedding_preserves_continuity (P Q : Type u) [Preorder P] [Preorder Q] (f : PosetEmbedding P Q)
    (hP : ContinuousLattice P) : ContinuousLattice Q := by
  exact ContinuousLattice.ofEmbedding f hP

end ContinuousLatticesPosetsApplicationsCanonicalLaneLean
end HautevilleHouse