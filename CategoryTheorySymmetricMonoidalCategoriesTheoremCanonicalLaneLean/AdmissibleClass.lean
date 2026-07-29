import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : SymmetricMonoidalAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  SymmetricMonoidalWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse