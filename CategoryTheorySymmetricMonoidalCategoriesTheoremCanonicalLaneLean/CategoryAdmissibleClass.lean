import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlib

structure CategoryAdmittedObject where
  symmetricMonoidalCategory : SymmetricMonoidalCategoryPackage
  coherenceClosed : CoherenceTheoremClosed (CoherenceTheoremPackage.mk symmetricMonoidalCategory _ _ _ _)
  braidedClosed : BraidedStructureClosed (BraidedStructurePackage.mk symmetricMonoidalCategory _ _ _)
  naturalityClosed : MonoidalNaturalityClosed (MonoidalNaturalityPackage.mk symmetricMonoidalCategory _ _ _ _ _)
  yonedaClosed : YonedaLemmaClosed (YonedaLemmaPackage.mk symmetricMonoidalCategory.category _ _ _ _ _)

def CategoryWitnessClosed (O : CategoryAdmittedObject) : Prop :=
  O.coherenceClosed ∧ O.braidedClosed ∧ O.naturalityClosed ∧ O.yonedaClosed

structure AdmissibleClass where
  object : CategoryAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CategoryWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse