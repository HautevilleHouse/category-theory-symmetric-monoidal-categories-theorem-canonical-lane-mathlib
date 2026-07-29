import canonicalLaneMathlib.AdmissibleClass

/-!
# Mac Lane Coherence Theorem Package
-/

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure CoherenceTheoremPackage {C : SymmetricMonoidalCategoryPackage}
    (Y : YonedaEmbeddingPackage C) where
  anyDiagramOfConstraintsCommutes : Prop
  normalFormExists : Prop
  uniqueReduction : Prop
  coherenceForSymmetricMonoidal : Prop

structure CoherenceTheoremEvidence {C : SymmetricMonoidalCategoryPackage}
    {Y : YonedaEmbeddingPackage C} (CT : CoherenceTheoremPackage Y) where
  anyDiagramOfConstraintsCommutesClosed : CT.anyDiagramOfConstraintsCommutes
  normalFormExistsClosed : CT.normalFormExists
  uniqueReductionClosed : CT.uniqueReduction
  coherenceForSymmetricMonoidalClosed : CT.coherenceForSymmetricMonoidal

def CoherenceTheoremClosed {C : SymmetricMonoidalCategoryPackage}
    {Y : YonedaEmbeddingPackage C} (CT : CoherenceTheoremPackage Y) : Prop :=
  CT.anyDiagramOfConstraintsCommutes ∧ CT.normalFormExists ∧
  CT.uniqueReduction ∧ CT.coherenceForSymmetricMonoidal

theorem coherence_theorem_closed_from_evidence
    {C : SymmetricMonoidalCategoryPackage} {Y : YonedaEmbeddingPackage C}
    (CT : CoherenceTheoremPackage Y) (E : CoherenceTheoremEvidence CT) :
    CoherenceTheoremClosed CT := by
  exact And.intro E.anyDiagramOfConstraintsCommutesClosed
    (And.intro E.normalFormExistsClosed
      (And.intro E.uniqueReductionClosed E.coherenceForSymmetricMonoidalClosed))

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse