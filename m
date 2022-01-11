Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0F248B435
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 11 Jan 2022 18:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243580AbiAKRoT (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 11 Jan 2022 12:44:19 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:60760
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1343892AbiAKRoS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 Jan 2022 12:44:18 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D223C3F175
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 17:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641923056;
        bh=K6TIKqnjo6Z8t6mBeP487I6M6x6bhz5R1p4bPRLMzE8=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=Sw7saUGOY87X++JtZo64fguWINqi7ZrDN4p8zYeMlEviises5GM2zA4qsd8Jo1WjD
         MW+Z/MiYBOgFKZFt1BYuz8FOlDHbq6mgVT/nlKR4eU3RBYgVxfNXMXAdvHAz51Itky
         GyafOrrrB9CNhDP6TbKAACai733Am7N6wX9o65wuGYXeQfeSEabbCRhF6OgN7y3oJO
         Gbj4ZOI+awoa13JWcDA9LmqF99HUyTskm3Ol1LVqZqlaT8fF7RloEag8JFctMm191k
         iB0EO/nzqqf3RBflhXZ165025NTQlzptBpyxw2P5TKIKHjiZoz2xc1v96PGGuxjHyg
         8nwOZuKu+HwHQ==
Received: by mail-ed1-f69.google.com with SMTP id i9-20020a05640242c900b003fe97faab62so4143126edc.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 09:44:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K6TIKqnjo6Z8t6mBeP487I6M6x6bhz5R1p4bPRLMzE8=;
        b=OMwdUJpkdke8As8RrcIFOtq4OBBhW8RDmO2e89KWEfDdJSTwXS7E6RGVqKM9qfQWOQ
         6E0tTnH9HKm+n/MsdESTUeuKLImeoC3up9H5SgQiO+GoKiJ4gsATaDxlTna84VxcgVFN
         WqllqO6PeUAAoJ47aJ3ILabnHw7mz6DAIG5teRFEIQclWRohnLd+FXfN1anuoZ/Uz0ZF
         gAuQ+BLM4pQ3rI+5dUO4nhlKl7nPabVy6DZcaIZrB6NLgt33nQzzBT3pq+wI/WHRePvQ
         yPk2F+rr/7/qaZ9FsjlZ4VY8Rq6QpJo/zgDqaESJteQTKdeCjzayuIuMBYAaDhkgh8QI
         elkQ==
X-Gm-Message-State: AOAM532iiidA167osg1tAvz9/1pJERaonjh0LCFiCisIy5kn9K2ukv3m
        O3lcMQoqqRKZ+tMSE33HBfCd8Lf++H1QCpd91F+XnCK4k1oQkKCbmGeRbevcPox6oEQdJIOBRSF
        LHFZrkviLnrUcVrWRp2qcp19XRP35v2fFF/MO3JSVo/YlBRpx
X-Received: by 2002:a17:906:65c8:: with SMTP id z8mr4793720ejn.727.1641923056537;
        Tue, 11 Jan 2022 09:44:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzaIofwwxy3qHNgZ3nVD9aWtNXx8g9e2xukgwL5AYPdzN+YUnwiTMTAX3Y/lQKKaSOAWYQCAg==
X-Received: by 2002:a17:906:65c8:: with SMTP id z8mr4793703ejn.727.1641923056331;
        Tue, 11 Jan 2022 09:44:16 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id g9sm3758657ejo.222.2022.01.11.09.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:44:15 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 0/4] mfd/power/regulators: dt-bindings: max14577: convert to dtschema
Date:   Tue, 11 Jan 2022 18:43:33 +0100
Message-Id: <20220111174337.223320-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Changes since v1
================
1. MFD: Use absolute path to schemas
2. Regulator: mention all allowed properties,
   additionalProperties=false, add min/max values for voltages and
   current, don't use patternProperties when not needed.

Dependencies
============
1. DTS patch 1/4: nothing depends on it, sending here so Rob's automatic
   checker won't complain about DTS.
   I will take it via Samsung SoC tree.

2. Final MFD patch (4/4) depends on regulator and power, so the last
   patches (2+3+4) should go via same tree.

Best regards,
Krzysztof

Krzysztof Kozlowski (4):
  ARM: dts: exynos: Align MAX77836 nodes with dtschema on Monk and
    Rinato
  dt-bindings: power: supply: maxim,max14577: convert to dtschema
  regulator: dt-bindings: maxim,max14577: convert to dtschema
  dt-bindings: mfd: maxim,max14577: convert to dtschema

 .../devicetree/bindings/mfd/max14577.txt      | 147 -------------
 .../bindings/mfd/maxim,max14577.yaml          | 195 ++++++++++++++++++
 .../bindings/power/supply/maxim,max14577.yaml |  84 ++++++++
 .../bindings/regulator/maxim,max14577.yaml    |  92 +++++++++
 MAINTAINERS                                   |   3 +-
 arch/arm/boot/dts/exynos3250-monk.dts         |   2 +-
 arch/arm/boot/dts/exynos3250-rinato.dts       |   2 +-
 7 files changed, 375 insertions(+), 150 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/max14577.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max14577.yaml
 create mode 100644 Documentation/devicetree/bindings/power/supply/maxim,max14577.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max14577.yaml

-- 
2.32.0

