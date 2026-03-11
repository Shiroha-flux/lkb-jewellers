DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-giselle',
    'Giselle',
    'Giselle - Marquise 4 Claw Solitaire with V Band Engagement Ring',
    'With four eagle-tipped claws and a sharp V point, Giselle is a sleek design featuring an exquisite marquise cut centre stone. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'marquise'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-giselle';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-giselle-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/giselle/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/giselle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-giselle-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/giselle/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/giselle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-giselle-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/giselle/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/giselle/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-giselle-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-giselle-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-giselle-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-giselle-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-giselle-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-giselle-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-giselle-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-giselle-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-giselle-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-giselle-size-0', 1, v_id, 'D'),
      ('ring-giselle-size-1', 2, v_id, 'E'),
      ('ring-giselle-size-2', 3, v_id, 'F'),
      ('ring-giselle-size-3', 4, v_id, 'G'),
      ('ring-giselle-size-4', 5, v_id, 'H'),
      ('ring-giselle-size-5', 6, v_id, 'I'),
      ('ring-giselle-size-6', 7, v_id, 'J'),
      ('ring-giselle-size-7', 8, v_id, 'K'),
      ('ring-giselle-size-8', 9, v_id, 'L'),
      ('ring-giselle-size-9', 10, v_id, 'M'),
      ('ring-giselle-size-10', 11, v_id, 'N'),
      ('ring-giselle-size-11', 12, v_id, 'O'),
      ('ring-giselle-size-12', 13, v_id, 'P'),
      ('ring-giselle-size-13', 14, v_id, 'Q'),
      ('ring-giselle-size-14', 15, v_id, 'R'),
      ('ring-giselle-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-giselle-specs',
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
    'ring-glinda',
    'Glinda',
    'Glinda - Princess 4 Claw Solitaire Engagement Ring',
    'Glinda is a striking solitaire engagement ring with an elegant princess cut centre stone, thick basket setting and four sleek square claws. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'princess'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-glinda';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-glinda-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/glinda/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/glinda/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-glinda-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/glinda/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/glinda/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-glinda-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/glinda/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/glinda/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-glinda-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-glinda-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-glinda-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-glinda-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-glinda-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-glinda-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-glinda-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-glinda-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-glinda-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-glinda-size-0', 1, v_id, 'D'),
      ('ring-glinda-size-1', 2, v_id, 'E'),
      ('ring-glinda-size-2', 3, v_id, 'F'),
      ('ring-glinda-size-3', 4, v_id, 'G'),
      ('ring-glinda-size-4', 5, v_id, 'H'),
      ('ring-glinda-size-5', 6, v_id, 'I'),
      ('ring-glinda-size-6', 7, v_id, 'J'),
      ('ring-glinda-size-7', 8, v_id, 'K'),
      ('ring-glinda-size-8', 9, v_id, 'L'),
      ('ring-glinda-size-9', 10, v_id, 'M'),
      ('ring-glinda-size-10', 11, v_id, 'N'),
      ('ring-glinda-size-11', 12, v_id, 'O'),
      ('ring-glinda-size-12', 13, v_id, 'P'),
      ('ring-glinda-size-13', 14, v_id, 'Q'),
      ('ring-glinda-size-14', 15, v_id, 'R'),
      ('ring-glinda-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-glinda-specs',
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
    'ring-grace',
    'Grace',
    'Grace - Oval 4 Claw Trilogy with Round Side Stones, Open Trellis Gallery and Tapered Band Engagement Ring',
    'Grace is a timeless trilogy design featuring a stunning oval cut centre stone and two round cut side stones placed within a trellis setting and tapered band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-grace';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-grace-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/grace/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/grace/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-grace-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/grace/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/grace/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-grace-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/grace/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/grace/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-grace-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-grace-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-grace-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-grace-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-grace-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-grace-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-grace-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-grace-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-grace-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-grace-size-0', 1, v_id, 'D'),
      ('ring-grace-size-1', 2, v_id, 'E'),
      ('ring-grace-size-2', 3, v_id, 'F'),
      ('ring-grace-size-3', 4, v_id, 'G'),
      ('ring-grace-size-4', 5, v_id, 'H'),
      ('ring-grace-size-5', 6, v_id, 'I'),
      ('ring-grace-size-6', 7, v_id, 'J'),
      ('ring-grace-size-7', 8, v_id, 'K'),
      ('ring-grace-size-8', 9, v_id, 'L'),
      ('ring-grace-size-9', 10, v_id, 'M'),
      ('ring-grace-size-10', 11, v_id, 'N'),
      ('ring-grace-size-11', 12, v_id, 'O'),
      ('ring-grace-size-12', 13, v_id, 'P'),
      ('ring-grace-size-13', 14, v_id, 'Q'),
      ('ring-grace-size-14', 15, v_id, 'R'),
      ('ring-grace-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-grace-specs',
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
    'ring-greta',
    'Greta',
    'Greta - Round 4 Claw Solitaire with Round Shoulder Stones Engagement Ring',
    'Sweet and feminine, Greta is a classic round solitaire design accentuated by round cut accent stones and seated in a gorgeous trilogy basket setting atop a tapered band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-greta';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-greta-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/greta/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/greta/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-greta-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/greta/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/greta/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-greta-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/greta/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/greta/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-greta-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-greta-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-greta-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-greta-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-greta-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-greta-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-greta-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-greta-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-greta-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-greta-size-0', 1, v_id, 'D'),
      ('ring-greta-size-1', 2, v_id, 'E'),
      ('ring-greta-size-2', 3, v_id, 'F'),
      ('ring-greta-size-3', 4, v_id, 'G'),
      ('ring-greta-size-4', 5, v_id, 'H'),
      ('ring-greta-size-5', 6, v_id, 'I'),
      ('ring-greta-size-6', 7, v_id, 'J'),
      ('ring-greta-size-7', 8, v_id, 'K'),
      ('ring-greta-size-8', 9, v_id, 'L'),
      ('ring-greta-size-9', 10, v_id, 'M'),
      ('ring-greta-size-10', 11, v_id, 'N'),
      ('ring-greta-size-11', 12, v_id, 'O'),
      ('ring-greta-size-12', 13, v_id, 'P'),
      ('ring-greta-size-13', 14, v_id, 'Q'),
      ('ring-greta-size-14', 15, v_id, 'R'),
      ('ring-greta-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-greta-specs',
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
    'ring-gwyneth',
    'Gwyneth',
    'Gwyneth - Emerald 4 Claw Solitaire with Hidden Halo and Pave Band Engagement Ring',
    'With a stunning emerald cut centre stone held by a 4-claw setting, Gwyneth is completed by a sparkling hidden halo &amp;amp; 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-gwyneth';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-gwyneth-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/gwyneth/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/gwyneth/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-gwyneth-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/gwyneth/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/gwyneth/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-gwyneth-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/gwyneth/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/gwyneth/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-gwyneth-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-gwyneth-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-gwyneth-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-gwyneth-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-gwyneth-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-gwyneth-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-gwyneth-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-gwyneth-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-gwyneth-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-gwyneth-size-0', 1, v_id, 'D'),
      ('ring-gwyneth-size-1', 2, v_id, 'E'),
      ('ring-gwyneth-size-2', 3, v_id, 'F'),
      ('ring-gwyneth-size-3', 4, v_id, 'G'),
      ('ring-gwyneth-size-4', 5, v_id, 'H'),
      ('ring-gwyneth-size-5', 6, v_id, 'I'),
      ('ring-gwyneth-size-6', 7, v_id, 'J'),
      ('ring-gwyneth-size-7', 8, v_id, 'K'),
      ('ring-gwyneth-size-8', 9, v_id, 'L'),
      ('ring-gwyneth-size-9', 10, v_id, 'M'),
      ('ring-gwyneth-size-10', 11, v_id, 'N'),
      ('ring-gwyneth-size-11', 12, v_id, 'O'),
      ('ring-gwyneth-size-12', 13, v_id, 'P'),
      ('ring-gwyneth-size-13', 14, v_id, 'Q'),
      ('ring-gwyneth-size-14', 15, v_id, 'R'),
      ('ring-gwyneth-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-gwyneth-specs',
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
    'ring-halle',
    'Halle',
    'Halle - Round Claw Trilogy with Pear Side Stones and Knife Edge Band Engagement Ring',
    'Halle is an elegant trilogy ring with a round cut centre stone and pear cut side stones, finished within a graceful basket setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-halle';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-halle-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/halle/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/halle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-halle-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/halle/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/halle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-halle-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/halle/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/halle/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-halle-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-halle-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-halle-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-halle-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-halle-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-halle-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-halle-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-halle-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-halle-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-halle-size-0', 1, v_id, 'D'),
      ('ring-halle-size-1', 2, v_id, 'E'),
      ('ring-halle-size-2', 3, v_id, 'F'),
      ('ring-halle-size-3', 4, v_id, 'G'),
      ('ring-halle-size-4', 5, v_id, 'H'),
      ('ring-halle-size-5', 6, v_id, 'I'),
      ('ring-halle-size-6', 7, v_id, 'J'),
      ('ring-halle-size-7', 8, v_id, 'K'),
      ('ring-halle-size-8', 9, v_id, 'L'),
      ('ring-halle-size-9', 10, v_id, 'M'),
      ('ring-halle-size-10', 11, v_id, 'N'),
      ('ring-halle-size-11', 12, v_id, 'O'),
      ('ring-halle-size-12', 13, v_id, 'P'),
      ('ring-halle-size-13', 14, v_id, 'Q'),
      ('ring-halle-size-14', 15, v_id, 'R'),
      ('ring-halle-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-halle-specs',
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
    'ring-hannah',
    'Hannah',
    'Hannah - Marquise Claw Trilogy with Pear Side Stones and Hidden Halo Engagement Ring',
    'The Hannah engagement ring is a unique marquise trilogy ring, complete with two pear cut side stones and a hidden halo held within a cathedral setting on a slim tapered band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-hannah';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-hannah-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/hannah/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/hannah/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-hannah-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/hannah/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/hannah/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-hannah-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/hannah/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/hannah/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-hannah-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-hannah-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-hannah-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-hannah-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-hannah-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-hannah-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-hannah-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-hannah-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-hannah-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-hannah-size-0', 1, v_id, 'D'),
      ('ring-hannah-size-1', 2, v_id, 'E'),
      ('ring-hannah-size-2', 3, v_id, 'F'),
      ('ring-hannah-size-3', 4, v_id, 'G'),
      ('ring-hannah-size-4', 5, v_id, 'H'),
      ('ring-hannah-size-5', 6, v_id, 'I'),
      ('ring-hannah-size-6', 7, v_id, 'J'),
      ('ring-hannah-size-7', 8, v_id, 'K'),
      ('ring-hannah-size-8', 9, v_id, 'L'),
      ('ring-hannah-size-9', 10, v_id, 'M'),
      ('ring-hannah-size-10', 11, v_id, 'N'),
      ('ring-hannah-size-11', 12, v_id, 'O'),
      ('ring-hannah-size-12', 13, v_id, 'P'),
      ('ring-hannah-size-13', 14, v_id, 'Q'),
      ('ring-hannah-size-14', 15, v_id, 'R'),
      ('ring-hannah-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-hannah-specs',
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
    'ring-hayley',
    'Hayley',
    'Hayley - Oval 4 Claw Solitaire with Wave Band and East West Setting Engagement Ring',
    'Hayley features a beautiful 4-claw oval cut stone resting within a uniquely curved band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'east_west'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-hayley';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-hayley-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/hayley/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/hayley/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-hayley-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/hayley/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/hayley/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-hayley-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/hayley/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/hayley/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-hayley-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-hayley-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-hayley-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-hayley-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-hayley-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-hayley-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-hayley-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-hayley-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-hayley-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-hayley-size-0', 1, v_id, 'D'),
      ('ring-hayley-size-1', 2, v_id, 'E'),
      ('ring-hayley-size-2', 3, v_id, 'F'),
      ('ring-hayley-size-3', 4, v_id, 'G'),
      ('ring-hayley-size-4', 5, v_id, 'H'),
      ('ring-hayley-size-5', 6, v_id, 'I'),
      ('ring-hayley-size-6', 7, v_id, 'J'),
      ('ring-hayley-size-7', 8, v_id, 'K'),
      ('ring-hayley-size-8', 9, v_id, 'L'),
      ('ring-hayley-size-9', 10, v_id, 'M'),
      ('ring-hayley-size-10', 11, v_id, 'N'),
      ('ring-hayley-size-11', 12, v_id, 'O'),
      ('ring-hayley-size-12', 13, v_id, 'P'),
      ('ring-hayley-size-13', 14, v_id, 'Q'),
      ('ring-hayley-size-14', 15, v_id, 'R'),
      ('ring-hayley-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-hayley-specs',
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
    'ring-hilary',
    'Hilary',
    'Hilary - Oval 4 Claw Solitaire with Cathedral High Setting Engagement Ring',
    'Hilary is a stunning oval solitaire engagement ring featuring a classic 4-claw setting complete with sweeping cathedral arches. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-hilary';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-hilary-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/hilary/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/hilary/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-hilary-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/hilary/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/hilary/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-hilary-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/hilary/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/hilary/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-hilary-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-hilary-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-hilary-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-hilary-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-hilary-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-hilary-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-hilary-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-hilary-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-hilary-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-hilary-size-0', 1, v_id, 'D'),
      ('ring-hilary-size-1', 2, v_id, 'E'),
      ('ring-hilary-size-2', 3, v_id, 'F'),
      ('ring-hilary-size-3', 4, v_id, 'G'),
      ('ring-hilary-size-4', 5, v_id, 'H'),
      ('ring-hilary-size-5', 6, v_id, 'I'),
      ('ring-hilary-size-6', 7, v_id, 'J'),
      ('ring-hilary-size-7', 8, v_id, 'K'),
      ('ring-hilary-size-8', 9, v_id, 'L'),
      ('ring-hilary-size-9', 10, v_id, 'M'),
      ('ring-hilary-size-10', 11, v_id, 'N'),
      ('ring-hilary-size-11', 12, v_id, 'O'),
      ('ring-hilary-size-12', 13, v_id, 'P'),
      ('ring-hilary-size-13', 14, v_id, 'Q'),
      ('ring-hilary-size-14', 15, v_id, 'R'),
      ('ring-hilary-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-hilary-specs',
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
    'ring-iris',
    'Iris',
    'Iris - Round 6 Claw Solitaire with Petal Gallery Engagement Ring',
    'Clasped by six eagle-tipped claws, the Iris engagement ring displays a stunning round cut stone set high within a uniquely feminine petal setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-iris';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-iris-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/iris/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/iris/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-iris-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/iris/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/iris/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-iris-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/iris/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/iris/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-iris-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-iris-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-iris-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-iris-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-iris-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-iris-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-iris-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-iris-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-iris-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-iris-size-0', 1, v_id, 'D'),
      ('ring-iris-size-1', 2, v_id, 'E'),
      ('ring-iris-size-2', 3, v_id, 'F'),
      ('ring-iris-size-3', 4, v_id, 'G'),
      ('ring-iris-size-4', 5, v_id, 'H'),
      ('ring-iris-size-5', 6, v_id, 'I'),
      ('ring-iris-size-6', 7, v_id, 'J'),
      ('ring-iris-size-7', 8, v_id, 'K'),
      ('ring-iris-size-8', 9, v_id, 'L'),
      ('ring-iris-size-9', 10, v_id, 'M'),
      ('ring-iris-size-10', 11, v_id, 'N'),
      ('ring-iris-size-11', 12, v_id, 'O'),
      ('ring-iris-size-12', 13, v_id, 'P'),
      ('ring-iris-size-13', 14, v_id, 'Q'),
      ('ring-iris-size-14', 15, v_id, 'R'),
      ('ring-iris-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-iris-specs',
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
    'ring-isla',
    'Isla',
    'Isla - Oval 4 Claw Trilogy Engagement Ring',
    'Isla reimagines the classic trilogy with three matching oval stones in refined eagle-claw settings. A cathedral foundation lifts each stone, creating a balanced three-stone silhouette with quiet contemporary structure. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-isla';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-isla-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/isla/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/isla/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-isla-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/isla/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/isla/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-isla-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/isla/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/isla/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-isla-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-isla-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-isla-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-isla-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-isla-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-isla-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-isla-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-isla-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-isla-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-isla-size-0', 1, v_id, 'D'),
      ('ring-isla-size-1', 2, v_id, 'E'),
      ('ring-isla-size-2', 3, v_id, 'F'),
      ('ring-isla-size-3', 4, v_id, 'G'),
      ('ring-isla-size-4', 5, v_id, 'H'),
      ('ring-isla-size-5', 6, v_id, 'I'),
      ('ring-isla-size-6', 7, v_id, 'J'),
      ('ring-isla-size-7', 8, v_id, 'K'),
      ('ring-isla-size-8', 9, v_id, 'L'),
      ('ring-isla-size-9', 10, v_id, 'M'),
      ('ring-isla-size-10', 11, v_id, 'N'),
      ('ring-isla-size-11', 12, v_id, 'O'),
      ('ring-isla-size-12', 13, v_id, 'P'),
      ('ring-isla-size-13', 14, v_id, 'Q'),
      ('ring-isla-size-14', 15, v_id, 'R'),
      ('ring-isla-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-isla-specs',
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
    'ring-ivy',
    'Ivy',
    'Ivy - Oval 4 Claw Solitaire with Petal Gallery and Accented Tiara Detail Engagement Ring',
    'Ivy centres an oval stone in a refined four-claw setting, framed by a sculpted petal gallery. A discreet tiara-style hidden halo sits beneath, adding quiet detail and soft, modern structure. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-ivy';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-ivy-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ivy/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ivy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ivy-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ivy/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ivy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ivy-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ivy/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ivy/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ivy-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-ivy-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-ivy-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-ivy-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ivy-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-ivy-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ivy-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-ivy-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-ivy-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-ivy-size-0', 1, v_id, 'D'),
      ('ring-ivy-size-1', 2, v_id, 'E'),
      ('ring-ivy-size-2', 3, v_id, 'F'),
      ('ring-ivy-size-3', 4, v_id, 'G'),
      ('ring-ivy-size-4', 5, v_id, 'H'),
      ('ring-ivy-size-5', 6, v_id, 'I'),
      ('ring-ivy-size-6', 7, v_id, 'J'),
      ('ring-ivy-size-7', 8, v_id, 'K'),
      ('ring-ivy-size-8', 9, v_id, 'L'),
      ('ring-ivy-size-9', 10, v_id, 'M'),
      ('ring-ivy-size-10', 11, v_id, 'N'),
      ('ring-ivy-size-11', 12, v_id, 'O'),
      ('ring-ivy-size-12', 13, v_id, 'P'),
      ('ring-ivy-size-13', 14, v_id, 'Q'),
      ('ring-ivy-size-14', 15, v_id, 'R'),
      ('ring-ivy-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-ivy-specs',
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
    'ring-jacinta',
    'Jacinta',
    'Jacinta - Pear 5 Claw Solitaire with Marquise and Round Accent Stones Engagement Ring',
    'Jacinta is a beautiful 5-claw pear solitaire design accentuated by a sparkling band of alternating marquise and round cut accent stones. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-jacinta';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-jacinta-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jacinta/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jacinta/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jacinta-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jacinta/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jacinta/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jacinta-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jacinta/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jacinta/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jacinta-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-jacinta-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-jacinta-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-jacinta-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jacinta-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-jacinta-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jacinta-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-jacinta-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-jacinta-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-jacinta-size-0', 1, v_id, 'D'),
      ('ring-jacinta-size-1', 2, v_id, 'E'),
      ('ring-jacinta-size-2', 3, v_id, 'F'),
      ('ring-jacinta-size-3', 4, v_id, 'G'),
      ('ring-jacinta-size-4', 5, v_id, 'H'),
      ('ring-jacinta-size-5', 6, v_id, 'I'),
      ('ring-jacinta-size-6', 7, v_id, 'J'),
      ('ring-jacinta-size-7', 8, v_id, 'K'),
      ('ring-jacinta-size-8', 9, v_id, 'L'),
      ('ring-jacinta-size-9', 10, v_id, 'M'),
      ('ring-jacinta-size-10', 11, v_id, 'N'),
      ('ring-jacinta-size-11', 12, v_id, 'O'),
      ('ring-jacinta-size-12', 13, v_id, 'P'),
      ('ring-jacinta-size-13', 14, v_id, 'Q'),
      ('ring-jacinta-size-14', 15, v_id, 'R'),
      ('ring-jacinta-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-jacinta-specs',
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
    'ring-jackie',
    'Jackie',
    'Jackie - Pear East West Claw Solitaire with Bypass Band  Engagement Ring',
    'Jackie centres a pear stone in a four-claw east–west setting, supported by a gently twisting bypass band. Soft curves wrap around the basket, creating a light, contemporary silhouette with sculptural balance. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'east_west'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-jackie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-jackie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jackie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jackie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jackie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jackie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jackie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jackie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jackie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jackie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jackie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-jackie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-jackie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-jackie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jackie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-jackie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jackie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-jackie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-jackie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-jackie-size-0', 1, v_id, 'D'),
      ('ring-jackie-size-1', 2, v_id, 'E'),
      ('ring-jackie-size-2', 3, v_id, 'F'),
      ('ring-jackie-size-3', 4, v_id, 'G'),
      ('ring-jackie-size-4', 5, v_id, 'H'),
      ('ring-jackie-size-5', 6, v_id, 'I'),
      ('ring-jackie-size-6', 7, v_id, 'J'),
      ('ring-jackie-size-7', 8, v_id, 'K'),
      ('ring-jackie-size-8', 9, v_id, 'L'),
      ('ring-jackie-size-9', 10, v_id, 'M'),
      ('ring-jackie-size-10', 11, v_id, 'N'),
      ('ring-jackie-size-11', 12, v_id, 'O'),
      ('ring-jackie-size-12', 13, v_id, 'P'),
      ('ring-jackie-size-13', 14, v_id, 'Q'),
      ('ring-jackie-size-14', 15, v_id, 'R'),
      ('ring-jackie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-jackie-specs',
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
    'ring-jana',
    'Jana',
    'Jana - Pear and Marquise Claw Toi et Moi with Cathedral High Setting Engagement Ring',
    'The exquisite Jana toi et moi engagement ring showcases a pear cut and marquise cut stone placed side by side atop an elegant cathedral setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'toi_et_moi'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-jana';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-jana-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jana/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jana/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jana-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jana/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jana/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jana-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jana/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jana/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jana-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-jana-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-jana-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-jana-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jana-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-jana-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jana-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-jana-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-jana-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-jana-size-0', 1, v_id, 'D'),
      ('ring-jana-size-1', 2, v_id, 'E'),
      ('ring-jana-size-2', 3, v_id, 'F'),
      ('ring-jana-size-3', 4, v_id, 'G'),
      ('ring-jana-size-4', 5, v_id, 'H'),
      ('ring-jana-size-5', 6, v_id, 'I'),
      ('ring-jana-size-6', 7, v_id, 'J'),
      ('ring-jana-size-7', 8, v_id, 'K'),
      ('ring-jana-size-8', 9, v_id, 'L'),
      ('ring-jana-size-9', 10, v_id, 'M'),
      ('ring-jana-size-10', 11, v_id, 'N'),
      ('ring-jana-size-11', 12, v_id, 'O'),
      ('ring-jana-size-12', 13, v_id, 'P'),
      ('ring-jana-size-13', 14, v_id, 'Q'),
      ('ring-jana-size-14', 15, v_id, 'R'),
      ('ring-jana-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-jana-specs',
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
    'ring-jane',
    'Jane',
    'Jane - Emerald 4 Claw Solitaire with Hidden Halo and Cathedral Setting Engagement Ring',
    'Jane is a sophisticated 4-claw emerald solitaire engagement ring with the added beauty of a hidden halo and cathedral setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-jane';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-jane-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jane/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jane/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jane-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jane/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jane/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jane-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jane/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jane/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jane-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-jane-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-jane-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-jane-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jane-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-jane-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jane-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-jane-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-jane-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-jane-size-0', 1, v_id, 'D'),
      ('ring-jane-size-1', 2, v_id, 'E'),
      ('ring-jane-size-2', 3, v_id, 'F'),
      ('ring-jane-size-3', 4, v_id, 'G'),
      ('ring-jane-size-4', 5, v_id, 'H'),
      ('ring-jane-size-5', 6, v_id, 'I'),
      ('ring-jane-size-6', 7, v_id, 'J'),
      ('ring-jane-size-7', 8, v_id, 'K'),
      ('ring-jane-size-8', 9, v_id, 'L'),
      ('ring-jane-size-9', 10, v_id, 'M'),
      ('ring-jane-size-10', 11, v_id, 'N'),
      ('ring-jane-size-11', 12, v_id, 'O'),
      ('ring-jane-size-12', 13, v_id, 'P'),
      ('ring-jane-size-13', 14, v_id, 'Q'),
      ('ring-jane-size-14', 15, v_id, 'R'),
      ('ring-jane-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-jane-specs',
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
    'ring-jayden',
    'Jayden',
    'Jayden - Round Claw Solitaire with Petal Gallery and Cigar Band Engagement Ring',
    'Clasped by six eagle-tipped claws in a petal design, the Jayden engagement ring displays a stunning round cut centre stone set low within a thick cigar band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-jayden';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-jayden-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jayden/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jayden/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jayden-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jayden/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jayden/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jayden-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jayden/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jayden/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jayden-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-jayden-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-jayden-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-jayden-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jayden-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-jayden-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jayden-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-jayden-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-jayden-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-jayden-size-0', 1, v_id, 'D'),
      ('ring-jayden-size-1', 2, v_id, 'E'),
      ('ring-jayden-size-2', 3, v_id, 'F'),
      ('ring-jayden-size-3', 4, v_id, 'G'),
      ('ring-jayden-size-4', 5, v_id, 'H'),
      ('ring-jayden-size-5', 6, v_id, 'I'),
      ('ring-jayden-size-6', 7, v_id, 'J'),
      ('ring-jayden-size-7', 8, v_id, 'K'),
      ('ring-jayden-size-8', 9, v_id, 'L'),
      ('ring-jayden-size-9', 10, v_id, 'M'),
      ('ring-jayden-size-10', 11, v_id, 'N'),
      ('ring-jayden-size-11', 12, v_id, 'O'),
      ('ring-jayden-size-12', 13, v_id, 'P'),
      ('ring-jayden-size-13', 14, v_id, 'Q'),
      ('ring-jayden-size-14', 15, v_id, 'R'),
      ('ring-jayden-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-jayden-specs',
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
    'ring-jaylene',
    'Jaylene',
    'Jaylene - Round 4 Claw Trilogy with Round Side Stones, Twisted Pave Band and Trellis Gallery Engagement Ring',
    'Jaylene is an exquisite round stone trilogy with an intricate twisted pavé band and woven trellis setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-jaylene';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-jaylene-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jaylene/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jaylene/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jaylene-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jaylene/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jaylene/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jaylene-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jaylene/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jaylene/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jaylene-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-jaylene-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-jaylene-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-jaylene-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jaylene-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-jaylene-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jaylene-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-jaylene-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-jaylene-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-jaylene-size-0', 1, v_id, 'D'),
      ('ring-jaylene-size-1', 2, v_id, 'E'),
      ('ring-jaylene-size-2', 3, v_id, 'F'),
      ('ring-jaylene-size-3', 4, v_id, 'G'),
      ('ring-jaylene-size-4', 5, v_id, 'H'),
      ('ring-jaylene-size-5', 6, v_id, 'I'),
      ('ring-jaylene-size-6', 7, v_id, 'J'),
      ('ring-jaylene-size-7', 8, v_id, 'K'),
      ('ring-jaylene-size-8', 9, v_id, 'L'),
      ('ring-jaylene-size-9', 10, v_id, 'M'),
      ('ring-jaylene-size-10', 11, v_id, 'N'),
      ('ring-jaylene-size-11', 12, v_id, 'O'),
      ('ring-jaylene-size-12', 13, v_id, 'P'),
      ('ring-jaylene-size-13', 14, v_id, 'Q'),
      ('ring-jaylene-size-14', 15, v_id, 'R'),
      ('ring-jaylene-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-jaylene-specs',
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
    'ring-jennifer',
    'Jennifer',
    'Jennifer - Pear 5 Claw Solitaire with Bypass Band Engagement Ring',
    'Jennifer centres a pear-shaped stone in a refined five-claw setting, supported by a gently twisting bypass band. Soft curves wrap around the basket, creating a light, contemporary silhouette. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-jennifer';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-jennifer-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jennifer/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jennifer/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jennifer-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jennifer/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jennifer/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jennifer-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jennifer/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jennifer/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jennifer-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-jennifer-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-jennifer-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-jennifer-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jennifer-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-jennifer-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jennifer-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-jennifer-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-jennifer-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-jennifer-size-0', 1, v_id, 'D'),
      ('ring-jennifer-size-1', 2, v_id, 'E'),
      ('ring-jennifer-size-2', 3, v_id, 'F'),
      ('ring-jennifer-size-3', 4, v_id, 'G'),
      ('ring-jennifer-size-4', 5, v_id, 'H'),
      ('ring-jennifer-size-5', 6, v_id, 'I'),
      ('ring-jennifer-size-6', 7, v_id, 'J'),
      ('ring-jennifer-size-7', 8, v_id, 'K'),
      ('ring-jennifer-size-8', 9, v_id, 'L'),
      ('ring-jennifer-size-9', 10, v_id, 'M'),
      ('ring-jennifer-size-10', 11, v_id, 'N'),
      ('ring-jennifer-size-11', 12, v_id, 'O'),
      ('ring-jennifer-size-12', 13, v_id, 'P'),
      ('ring-jennifer-size-13', 14, v_id, 'Q'),
      ('ring-jennifer-size-14', 15, v_id, 'R'),
      ('ring-jennifer-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-jennifer-specs',
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
    'ring-josephine',
    'Josephine',
    'Josephine - Radiant 4 Claw Solitaire with Round Accent Stones and Wrap Around Hidden Halo Engagement Ring',
    'The 4-claw radiant solitaire design is elevated in the Josephine ring with a unique round cut side stone band and sparkling wrap-around hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-josephine';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-josephine-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/josephine/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/josephine/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-josephine-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/josephine/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/josephine/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-josephine-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/josephine/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/josephine/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-josephine-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-josephine-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-josephine-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-josephine-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-josephine-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-josephine-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-josephine-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-josephine-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-josephine-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-josephine-size-0', 1, v_id, 'D'),
      ('ring-josephine-size-1', 2, v_id, 'E'),
      ('ring-josephine-size-2', 3, v_id, 'F'),
      ('ring-josephine-size-3', 4, v_id, 'G'),
      ('ring-josephine-size-4', 5, v_id, 'H'),
      ('ring-josephine-size-5', 6, v_id, 'I'),
      ('ring-josephine-size-6', 7, v_id, 'J'),
      ('ring-josephine-size-7', 8, v_id, 'K'),
      ('ring-josephine-size-8', 9, v_id, 'L'),
      ('ring-josephine-size-9', 10, v_id, 'M'),
      ('ring-josephine-size-10', 11, v_id, 'N'),
      ('ring-josephine-size-11', 12, v_id, 'O'),
      ('ring-josephine-size-12', 13, v_id, 'P'),
      ('ring-josephine-size-13', 14, v_id, 'Q'),
      ('ring-josephine-size-14', 15, v_id, 'R'),
      ('ring-josephine-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-josephine-specs',
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

