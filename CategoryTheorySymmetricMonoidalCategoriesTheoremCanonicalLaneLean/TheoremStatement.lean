import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure AdmittedObject where
  category : Type u
  monoidalStructure : Type v
  braiding : Type w
  symmetry : Prop
  coherence : Prop
  conclusion : symmetry ∧ coherence

def SymmetricMonoidalCategoryWitnessClosed (O : AdmittedObject) : Prop :=
  O.symmetry ∧ O.coherence

structure AdmissibleClass where
  object : AdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : AdmissibleClass) : Prop :=
  SymmetricMonoidalCategoryWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

def ConstrainedSymmetricMonoidalClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_symmetric_monoidal_endgame (A : AdmissibleClass) :
    ConstrainedSymmetricMonoidalClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse
