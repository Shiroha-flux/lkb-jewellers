DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-journee',
    'Journee',
    'Journee - Statement Emerald Bezel Solitaire with Open Cathedral Setting Engagement Ring',
    'Simple and sophisticated, the Journee engagement ring features a striking emerald cut centre stone framed within a bezel setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-journee';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-journee-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/journee/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/journee/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-journee-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/journee/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/journee/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-journee-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/journee/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/journee/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-journee-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-journee-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-journee-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-journee-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-journee-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-journee-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-journee-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-journee-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-journee-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-journee-size-0', 1, v_id, 'D'),
      ('ring-journee-size-1', 2, v_id, 'E'),
      ('ring-journee-size-2', 3, v_id, 'F'),
      ('ring-journee-size-3', 4, v_id, 'G'),
      ('ring-journee-size-4', 5, v_id, 'H'),
      ('ring-journee-size-5', 6, v_id, 'I'),
      ('ring-journee-size-6', 7, v_id, 'J'),
      ('ring-journee-size-7', 8, v_id, 'K'),
      ('ring-journee-size-8', 9, v_id, 'L'),
      ('ring-journee-size-9', 10, v_id, 'M'),
      ('ring-journee-size-10', 11, v_id, 'N'),
      ('ring-journee-size-11', 12, v_id, 'O'),
      ('ring-journee-size-12', 13, v_id, 'P'),
      ('ring-journee-size-13', 14, v_id, 'Q'),
      ('ring-journee-size-14', 15, v_id, 'R'),
      ('ring-journee-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-journee-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-judy',
    'Judy',
    'Judy - Radiant 4 Claw Solitaire Engagement Ring',
    'The Judy engagement ring is a timeless solitaire design featuring an exquisite radiant cut centre stone and 4-claw setting. This elegant engagement ring is available in both high and low setting heights. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'radiant'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-judy';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-judy-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/judy/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/judy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-judy-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/judy/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/judy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-judy-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/judy/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/judy/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-judy-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-judy-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-judy-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-judy-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-judy-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-judy-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-judy-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-judy-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-judy-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-judy-size-0', 1, v_id, 'D'),
      ('ring-judy-size-1', 2, v_id, 'E'),
      ('ring-judy-size-2', 3, v_id, 'F'),
      ('ring-judy-size-3', 4, v_id, 'G'),
      ('ring-judy-size-4', 5, v_id, 'H'),
      ('ring-judy-size-5', 6, v_id, 'I'),
      ('ring-judy-size-6', 7, v_id, 'J'),
      ('ring-judy-size-7', 8, v_id, 'K'),
      ('ring-judy-size-8', 9, v_id, 'L'),
      ('ring-judy-size-9', 10, v_id, 'M'),
      ('ring-judy-size-10', 11, v_id, 'N'),
      ('ring-judy-size-11', 12, v_id, 'O'),
      ('ring-judy-size-12', 13, v_id, 'P'),
      ('ring-judy-size-13', 14, v_id, 'Q'),
      ('ring-judy-size-14', 15, v_id, 'R'),
      ('ring-judy-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-judy-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-julia',
    'Julia',
    'Julia - Oval 4 Claw Solitaire with Hidden Halo, Pave Band and Cathedral High Setting Engagement Ring',
    'Julia is a stunning 4-claw oval solitaire featuring a sparkling hidden halo, sweeping cathedral arches and a 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-julia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-julia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/julia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/julia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-julia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/julia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/julia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-julia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/julia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/julia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-julia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-julia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-julia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-julia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-julia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-julia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-julia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-julia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-julia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-julia-size-0', 1, v_id, 'D'),
      ('ring-julia-size-1', 2, v_id, 'E'),
      ('ring-julia-size-2', 3, v_id, 'F'),
      ('ring-julia-size-3', 4, v_id, 'G'),
      ('ring-julia-size-4', 5, v_id, 'H'),
      ('ring-julia-size-5', 6, v_id, 'I'),
      ('ring-julia-size-6', 7, v_id, 'J'),
      ('ring-julia-size-7', 8, v_id, 'K'),
      ('ring-julia-size-8', 9, v_id, 'L'),
      ('ring-julia-size-9', 10, v_id, 'M'),
      ('ring-julia-size-10', 11, v_id, 'N'),
      ('ring-julia-size-11', 12, v_id, 'O'),
      ('ring-julia-size-12', 13, v_id, 'P'),
      ('ring-julia-size-13', 14, v_id, 'Q'),
      ('ring-julia-size-14', 15, v_id, 'R'),
      ('ring-julia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-julia-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-juliette',
    'Juliette',
    'Juliette - Radiant 4 Claw Trilogy with Trapezoid Side Stones and Low Setting Engagement Ring',
    'The graceful Juliette design showcases a radiant cut centre stone bordered by two brilliant trapezoid accent stones within a low-set basket setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'radiant'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'low_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-juliette';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-juliette-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/juliette/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/juliette/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-juliette-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/juliette/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/juliette/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-juliette-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/juliette/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/juliette/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-juliette-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-juliette-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-juliette-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-juliette-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-juliette-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-juliette-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-juliette-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-juliette-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-juliette-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-juliette-size-0', 1, v_id, 'D'),
      ('ring-juliette-size-1', 2, v_id, 'E'),
      ('ring-juliette-size-2', 3, v_id, 'F'),
      ('ring-juliette-size-3', 4, v_id, 'G'),
      ('ring-juliette-size-4', 5, v_id, 'H'),
      ('ring-juliette-size-5', 6, v_id, 'I'),
      ('ring-juliette-size-6', 7, v_id, 'J'),
      ('ring-juliette-size-7', 8, v_id, 'K'),
      ('ring-juliette-size-8', 9, v_id, 'L'),
      ('ring-juliette-size-9', 10, v_id, 'M'),
      ('ring-juliette-size-10', 11, v_id, 'N'),
      ('ring-juliette-size-11', 12, v_id, 'O'),
      ('ring-juliette-size-12', 13, v_id, 'P'),
      ('ring-juliette-size-13', 14, v_id, 'Q'),
      ('ring-juliette-size-14', 15, v_id, 'R'),
      ('ring-juliette-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-juliette-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-kala',
    'Kala',
    'Kala - Oval 4 Claw Solitaire with Bypass Band Engagement Ring',
    'Kala centres an oval stone in a four-claw setting, framed by a gently twisting bypass band. The band’s soft curves move around the basket, giving the design a light, contemporary silhouette with sculptural ease. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-kala';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-kala-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kala/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kala/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kala-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kala/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kala/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-kala-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/kala/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/kala/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kala-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-kala-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-kala-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-kala-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kala-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-kala-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-kala-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-kala-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-kala-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-kala-size-0', 1, v_id, 'D'),
      ('ring-kala-size-1', 2, v_id, 'E'),
      ('ring-kala-size-2', 3, v_id, 'F'),
      ('ring-kala-size-3', 4, v_id, 'G'),
      ('ring-kala-size-4', 5, v_id, 'H'),
      ('ring-kala-size-5', 6, v_id, 'I'),
      ('ring-kala-size-6', 7, v_id, 'J'),
      ('ring-kala-size-7', 8, v_id, 'K'),
      ('ring-kala-size-8', 9, v_id, 'L'),
      ('ring-kala-size-9', 10, v_id, 'M'),
      ('ring-kala-size-10', 11, v_id, 'N'),
      ('ring-kala-size-11', 12, v_id, 'O'),
      ('ring-kala-size-12', 13, v_id, 'P'),
      ('ring-kala-size-13', 14, v_id, 'Q'),
      ('ring-kala-size-14', 15, v_id, 'R'),
      ('ring-kala-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-kala-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;