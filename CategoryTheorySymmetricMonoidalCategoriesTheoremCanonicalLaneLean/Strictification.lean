import HautevilleHouse.CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean.CoherenceTheorem

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

open CategoryTheory
open MonoidalCategory

structure StrictificationPackage (C : Type u) [Category.{v} C] (P : SymmetricMonoidalPackage C) (Q : CoherencePackage C P) where
  strictMonoidalCategory : Type u
  equivalenceWithOriginal : Prop
  coherencePreserved : Prop

structure StrictificationEvidence (C : Type u) [Category.{v} C] {P : SymmetricMonoidalPackage C} {Q : CoherencePackage C P} (R : StrictificationPackage C P Q) where
  equivalenceWithOriginalClosed : R.equivalenceWithOriginal
  coherencePreservedClosed : R.coherencePreserved

def StrictificationClosed (C : Type u) [Category.{v} C] {P : SymmetricMonoidalPackage C} {Q : CoherencePackage C P} (R : StrictificationPackage C P Q) : Prop :=
  R.equivalenceWithOriginal ∧ R.coherencePreserved

theorem strictification_closed_from_evidence (C : Type u) [Category.{v} C] {P : SymmetricMonoidalPackage C} {Q : CoherencePackage C P} (R : StrictificationPackage C P Q) (E : StrictificationEvidence C R) :
    StrictificationClosed C R := by
  exact And.intro E.equivalenceWithOriginalClosed E.coherencePreservedClosed

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse