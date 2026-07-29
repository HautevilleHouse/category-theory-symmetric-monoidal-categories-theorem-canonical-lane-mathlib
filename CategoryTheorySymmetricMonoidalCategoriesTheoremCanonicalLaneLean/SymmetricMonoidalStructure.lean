import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean

structure SymmetricMonoidalStructurePackage where
  tensorProduct : Type u → Type u → Type u
  unitObject : Type u
  associator : ∀ (A B C : Type u), A ⊗ (B ⊗ C) ≅ (A ⊗ B) ⊗ C
  leftUnitor : ∀ (A : Type u), unitObject ⊗ A ≅ A
  rightUnitor : ∀ (A : Type u), A ⊗ unitObject ≅ A
  symmetry : ∀ (A B : Type u), A ⊗ B ≅ B ⊗ A
  coherenceConditions : Prop

structure SymmetricMonoidalStructureEvidence (S : SymmetricMonoidalStructurePackage) where
  associatorNatural : S.associatorNatural
  leftUnitorNatural : S.leftUnitorNatural
  rightUnitorNatural : S.rightUnitorNatural
  symmetryNatural : S.symmetryNatural
  pentagonCoherence : S.pentagonCoherence
  triangleCoherence : S.triangleCoherence
  hexagonCoherence : S.hexagonCoherence

def SymmetricMonoidalStructureClosed (S : SymmetricMonoidalStructurePackage) : Prop :=
  S.associatorNatural ∧ S.leftUnitorNatural ∧ S.rightUnitorNatural ∧
  S.symmetryNatural ∧ S.pentagonCoherence ∧ S.triangleCoherence ∧ S.hexagonCoherence

theorem symmetric_monoidal_structure_closed_from_evidence
    (S : SymmetricMonoidalStructurePackage)
    (E : SymmetricMonoidalStructureEvidence S) : SymmetricMonoidalStructureClosed S := by
  exact And.intro E.associatorNatural
    (And.intro E.leftUnitorNatural
      (And.intro E.rightUnitorNatural
        (And.intro E.symmetryNatural
          (And.intro E.pentagonCoherence
            (And.intro E.triangleCoherence E.hexagonCoherence)))))

end CategoryTheorySymmetricMonoidalCategoriesTheoremCanonicalLaneLean
end HautevilleHouse
