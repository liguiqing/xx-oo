package com.xx.oo.app.repository;

import com.xx.oo.app.domain.Authority;
import com.xx.oo.app.domain.Authority;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Spring Data JPA repository for the {@link Authority} entity.
 */
public interface AuthorityRepository extends JpaRepository<Authority, String> {}
