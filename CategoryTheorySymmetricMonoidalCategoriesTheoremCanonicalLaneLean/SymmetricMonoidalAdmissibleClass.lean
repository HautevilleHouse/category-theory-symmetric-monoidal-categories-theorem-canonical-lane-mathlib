import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure SymmetricMonoidalAdmissibleObject where
  category : SymmetricMonoidalCategory
  coherenceComplete : Prop

structure AdmissibleClass where
  object : SymmetricMonoidalAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  SymmetricMonoidalCategoryClosed A.object.category ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse