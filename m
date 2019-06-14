Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E99746954
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 14 Jun 2019 22:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727206AbfFNUbx (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 14 Jun 2019 16:31:53 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45003 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbfFNUbw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 14 Jun 2019 16:31:52 -0400
Received: by mail-pl1-f194.google.com with SMTP id t7so1442477plr.11;
        Fri, 14 Jun 2019 13:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8o+2bmk3JHw3bcscvg5i4csgQd4Cy57o3YZ91vrIQhk=;
        b=fmawliYbYe9RXgjYQw83JcEt3qnDc3a9Nr/dyRNlHVBsgPGykJOXH3w4C6Eu8DUyrl
         CrVaRFJv6oVjd8TD6dc/eUa7oEIvf83UPAFA5Q4p1A3H4Wds8oD+aKkPZAZ4GAloWSXF
         lkcOfoeKV9tkQsnV6TZGx4twjlJ657SfhMJThGkxwoqTmSl42l3+NQmlYoAwVd6LQCPI
         H310JzrVEUHkQYzmyWSIsaIQQrQdSBYWq3oxxJz4A54WeHv/5W2NdVQQByL9alDO0mVr
         DOsXQMJrpoV352/sQafvE8ReOUVpCrOQxC7VUWjKJbQC9TYzmOxWI8JDfDcweI/Lbyqq
         1p1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8o+2bmk3JHw3bcscvg5i4csgQd4Cy57o3YZ91vrIQhk=;
        b=TgFPplICSayyVyBtpX45iBAsznDnvse8xixRe5ULP4DAnC9tyXbg0THEkblXVqouh8
         ZLkEy0W0Zd88wFsfZMLgWl5iT9Vub0pi6KbYNLXi30sKe3NJt1mGjTBW5Dbkb/+Lhj/L
         DpcqPEgeNqfQC5/6k4Bg6AosVtWtX9VVvq5R4FnBfpFIQ5JLJ0tIeg6pkhHNiQOrB128
         UJyYySMhjjRppKVcRF+/e7U06lS0/3T2VGEBXFflbaDz/VZzrMFsD3Ggy+DARXImoy6D
         d5HBlK4G/nr81h+nPJu4CeJhZLKlQem6C7gpmqmYg+pSIywRYI0JJ+e3zIFJZ4rB46zo
         R+Iw==
X-Gm-Message-State: APjAAAVFYyx3lG5xaEpo4AhQ38cg0Anf/fwI+2ygPK996E7RI5X0bNkU
        hokPzStd4cKbF8J4DLVww/k=
X-Google-Smtp-Source: APXvYqz8fXZMHh678m38GXZ7cOMf9Jew7ASJ24aKHKsv3zkzKPKgQG0N0NmX7eCgd61B1rxu1Qc+Kg==
X-Received: by 2002:a17:902:8203:: with SMTP id x3mr11439487pln.304.1560544311481;
        Fri, 14 Jun 2019 13:31:51 -0700 (PDT)
Received: from localhost.localdomain ([162.251.69.147])
        by smtp.gmail.com with ESMTPSA id 188sm5189016pfe.30.2019.06.14.13.31.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 13:31:50 -0700 (PDT)
From:   Joseph Kogut <joseph.kogut@gmail.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, kgene@kernel.org,
        krzk@kernel.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Joseph Kogut <joseph.kogut@gmail.com>
Subject: [PATCH 1/2] dt-bindings: gpu: add Exynos Mali vendor specifics
Date:   Fri, 14 Jun 2019 13:31:43 -0700
Message-Id: <20190614203144.3850-1-joseph.kogut@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Document vendor specific compatible string for Mali gpus on Exynos SoCs.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
index 1b1a74129141..a9704c736d07 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
@@ -18,6 +18,7 @@ Required properties:
     + "amlogic,meson-gxm-mali"
     + "rockchip,rk3288-mali"
     + "rockchip,rk3399-mali"
+    + "samsung,exynos-mali"
 
 - reg : Physical base address of the device and length of the register area.
 
-- 
2.22.0

