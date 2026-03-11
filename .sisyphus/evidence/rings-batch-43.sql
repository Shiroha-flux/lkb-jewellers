DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-thea',
    'Thea',
    'Thea - Radiant 4 Claw Solitaire with Hidden Halo and Pave Band Engagement Ring',
    'Thea is a sophisticated 4-claw radiant solitaire engagement ring with the added sparkle of a hidden halo and 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'radiant'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-thea';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-thea-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/thea/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/thea/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-thea-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/thea/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/thea/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-thea-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/thea/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/thea/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-thea-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-thea-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-thea-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-thea-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-thea-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-thea-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-thea-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-thea-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-thea-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-thea-size-0', 1, v_id, 'D'),
      ('ring-thea-size-1', 2, v_id, 'E'),
      ('ring-thea-size-2', 3, v_id, 'F'),
      ('ring-thea-size-3', 4, v_id, 'G'),
      ('ring-thea-size-4', 5, v_id, 'H'),
      ('ring-thea-size-5', 6, v_id, 'I'),
      ('ring-thea-size-6', 7, v_id, 'J'),
      ('ring-thea-size-7', 8, v_id, 'K'),
      ('ring-thea-size-8', 9, v_id, 'L'),
      ('ring-thea-size-9', 10, v_id, 'M'),
      ('ring-thea-size-10', 11, v_id, 'N'),
      ('ring-thea-size-11', 12, v_id, 'O'),
      ('ring-thea-size-12', 13, v_id, 'P'),
      ('ring-thea-size-13', 14, v_id, 'Q'),
      ('ring-thea-size-14', 15, v_id, 'R'),
      ('ring-thea-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-thea-specs',
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
    'ring-tilly',
    'Tilly',
    'Tilly - Elongated Cushion Claw Solitaire with Petal Gallery and Accent Leaf Detail Engagement Ring',
    'Tilly is a 4-claw elongated cushion that offers a twist on a classic solitaire with an accented petal gallery. Emphasising beauty in the smallest details, a secret hidden halo is encased within the petite petals, offering support for a subtle yet elegant form. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-tilly';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-tilly-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/tilly/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/tilly/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-tilly-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/tilly/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/tilly/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-tilly-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/tilly/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/tilly/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-tilly-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-tilly-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-tilly-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-tilly-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-tilly-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-tilly-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-tilly-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-tilly-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-tilly-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-tilly-size-0', 1, v_id, 'D'),
      ('ring-tilly-size-1', 2, v_id, 'E'),
      ('ring-tilly-size-2', 3, v_id, 'F'),
      ('ring-tilly-size-3', 4, v_id, 'G'),
      ('ring-tilly-size-4', 5, v_id, 'H'),
      ('ring-tilly-size-5', 6, v_id, 'I'),
      ('ring-tilly-size-6', 7, v_id, 'J'),
      ('ring-tilly-size-7', 8, v_id, 'K'),
      ('ring-tilly-size-8', 9, v_id, 'L'),
      ('ring-tilly-size-9', 10, v_id, 'M'),
      ('ring-tilly-size-10', 11, v_id, 'N'),
      ('ring-tilly-size-11', 12, v_id, 'O'),
      ('ring-tilly-size-12', 13, v_id, 'P'),
      ('ring-tilly-size-13', 14, v_id, 'Q'),
      ('ring-tilly-size-14', 15, v_id, 'R'),
      ('ring-tilly-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-tilly-specs',
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
    'ring-trinity',
    'Trinity',
    'Trinity - Oval 4 Claw Solitaire with Twisted Band Engagement Ring',
    'Trinity features a gently twisted band leading to an oval centre stone held in a four-claw setting. A subtle hidden halo sits beneath, adding refined structural detail to this considered solitaire. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-trinity';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-trinity-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/trinity/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/trinity/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-trinity-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/trinity/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/trinity/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-trinity-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/trinity/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/trinity/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-trinity-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-trinity-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-trinity-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-trinity-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-trinity-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-trinity-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-trinity-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-trinity-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-trinity-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-trinity-size-0', 1, v_id, 'D'),
      ('ring-trinity-size-1', 2, v_id, 'E'),
      ('ring-trinity-size-2', 3, v_id, 'F'),
      ('ring-trinity-size-3', 4, v_id, 'G'),
      ('ring-trinity-size-4', 5, v_id, 'H'),
      ('ring-trinity-size-5', 6, v_id, 'I'),
      ('ring-trinity-size-6', 7, v_id, 'J'),
      ('ring-trinity-size-7', 8, v_id, 'K'),
      ('ring-trinity-size-8', 9, v_id, 'L'),
      ('ring-trinity-size-9', 10, v_id, 'M'),
      ('ring-trinity-size-10', 11, v_id, 'N'),
      ('ring-trinity-size-11', 12, v_id, 'O'),
      ('ring-trinity-size-12', 13, v_id, 'P'),
      ('ring-trinity-size-13', 14, v_id, 'Q'),
      ('ring-trinity-size-14', 15, v_id, 'R'),
      ('ring-trinity-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-trinity-specs',
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
    'ring-valeria',
    'Valeria',
    'Valeria - Emerald Bezel Solitaire with Hidden Halo and Cathedral Setting Engagement Ring',
    'Valeria is a modern interpretation of the bezel design, encapsulating an emerald-cut centre stone within a deep setting. A hidden pavé detail sits within the bezel, supported by a cathedral foundation for balanced structure. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-valeria';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-valeria-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/valeria/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/valeria/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-valeria-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/valeria/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/valeria/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-valeria-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/valeria/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/valeria/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-valeria-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-valeria-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-valeria-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-valeria-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-valeria-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-valeria-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-valeria-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-valeria-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-valeria-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-valeria-size-0', 1, v_id, 'D'),
      ('ring-valeria-size-1', 2, v_id, 'E'),
      ('ring-valeria-size-2', 3, v_id, 'F'),
      ('ring-valeria-size-3', 4, v_id, 'G'),
      ('ring-valeria-size-4', 5, v_id, 'H'),
      ('ring-valeria-size-5', 6, v_id, 'I'),
      ('ring-valeria-size-6', 7, v_id, 'J'),
      ('ring-valeria-size-7', 8, v_id, 'K'),
      ('ring-valeria-size-8', 9, v_id, 'L'),
      ('ring-valeria-size-9', 10, v_id, 'M'),
      ('ring-valeria-size-10', 11, v_id, 'N'),
      ('ring-valeria-size-11', 12, v_id, 'O'),
      ('ring-valeria-size-12', 13, v_id, 'P'),
      ('ring-valeria-size-13', 14, v_id, 'Q'),
      ('ring-valeria-size-14', 15, v_id, 'R'),
      ('ring-valeria-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-valeria-specs',
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
    'ring-violetta',
    'Violetta',
    'Violetta - Elongated Cushion Claw Solitaire with Hidden Halo and Twisted Alternating Pave Band Engagement Ring',
    'Violetta is an elegant twisted engagement ring, where sleek pavé and polished metal intertwine in a refined half-circle. A 4-claw elongated cushion centre stone is illuminated by a hidden halo beneath Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-violetta';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-violetta-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/violetta/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/violetta/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-violetta-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/violetta/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/violetta/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-violetta-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/violetta/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/violetta/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-violetta-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-violetta-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-violetta-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-violetta-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-violetta-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-violetta-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-violetta-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-violetta-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-violetta-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-violetta-size-0', 1, v_id, 'D'),
      ('ring-violetta-size-1', 2, v_id, 'E'),
      ('ring-violetta-size-2', 3, v_id, 'F'),
      ('ring-violetta-size-3', 4, v_id, 'G'),
      ('ring-violetta-size-4', 5, v_id, 'H'),
      ('ring-violetta-size-5', 6, v_id, 'I'),
      ('ring-violetta-size-6', 7, v_id, 'J'),
      ('ring-violetta-size-7', 8, v_id, 'K'),
      ('ring-violetta-size-8', 9, v_id, 'L'),
      ('ring-violetta-size-9', 10, v_id, 'M'),
      ('ring-violetta-size-10', 11, v_id, 'N'),
      ('ring-violetta-size-11', 12, v_id, 'O'),
      ('ring-violetta-size-12', 13, v_id, 'P'),
      ('ring-violetta-size-13', 14, v_id, 'Q'),
      ('ring-violetta-size-14', 15, v_id, 'R'),
      ('ring-violetta-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-violetta-specs',
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