Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92B598D12F
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 14 Aug 2019 12:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727945AbfHNKqX (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 14 Aug 2019 06:46:23 -0400
Received: from mail-vk1-f201.google.com ([209.85.221.201]:34056 "EHLO
        mail-vk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727941AbfHNKqW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Aug 2019 06:46:22 -0400
Received: by mail-vk1-f201.google.com with SMTP id g68so43619318vkb.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2019 03:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=4SGVKzSfOWWb5eHKsBAlwwo8FxZigEPwWxwM+lh0QRU=;
        b=jsibvCEaVrpw/TIVu7voxbDfejQBHrmB5WikoOLqMXW3Sz6KSshq9AHg5uJF+51H7A
         BzZGy+I1w9PPt7wVhSUK1mLfrAROtdLA6BauC8IvBF3UYhGVr/xbBxog/ugoCPM08jgm
         RMlTYL2a2K6mkw858Ip783T1xBDXOaH3+AcaRHMUV7TcYiCYF6fTPu7GjLFmxSHARTgm
         LedOl5171OM4hR+KhMB2EWKKFvjnL99MoEryuXx36fhWtPGML6nkft+ugutYtG9IS063
         f74pWb3nL7BZ1SXUsllZ71l9xdLWb1j9bQeDEa5Oba66jqEZ8cwGCnOWBlCxSYXjQBAe
         Eq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=4SGVKzSfOWWb5eHKsBAlwwo8FxZigEPwWxwM+lh0QRU=;
        b=mNsAIibz9XeNR+Pn+ovfJ7zRXHidifj7e6UkFMGzTXBEYyfucv7dX7Fyp9HRMbnHJJ
         rxzlqWez+FuXb3WnV9WBATgxjsmUuT93KMEZo7t0VEGeEmjsoKaFzSGSW5AEcgcMiARh
         +a+Oi1hasGi9fyswmYmTH2OGKU2onqMh1TlQfa9hQtfIrqpOpDKCP+GCVa7ieG1vdZe4
         qD5Itxth5Vk4CYnlAloc+Q1hj52ZPOOmq6IYHIWnRRpMDje1j5W8gz7r6TYGeLNF6y4c
         ZeyrsFBqRyG1UznCKm0b/Vw5DF5uDEVQdXeVtgqDYhdoXQXapQzIyRuYRJkqgRuOuOTQ
         A7Lw==
X-Gm-Message-State: APjAAAVYFOOzLKyKeNIhsfS9itSOhrpRXEbMotXL5y2kuzz0q1Kreyio
        rTx3qnjzupW7/Rys0VMxEwF45URtwkk=
X-Google-Smtp-Source: APXvYqwXZ7fmlU6P4H/oUbMNN/nO/AXuHUc6uhtW6sQQPOnLTG3uAvcrMDgfHUcNa4GJlUXADTntNKvmw/Q=
X-Received: by 2002:a1f:7c0e:: with SMTP id x14mr6828024vkc.0.1565779581300;
 Wed, 14 Aug 2019 03:46:21 -0700 (PDT)
Date:   Wed, 14 Aug 2019 12:45:07 +0200
In-Reply-To: <20190814104520.6001-1-darekm@google.com>
Message-Id: <20190814104520.6001-10-darekm@google.com>
Mime-Version: 1.0
References: <20190814104520.6001-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v7 9/9] drm: exynos: exynos_hdmi: use cec_notifier_conn_(un)register
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use the new cec_notifier_conn_(un)register() functions to
(un)register the notifier for the HDMI connector, and fill in
the cec_connector_info.

Changes since v2:
	- removed unnecessary call to invalidate phys address before
	deregistering the notifier,
	- use cec_notifier_phys_addr_invalidate instead of setting
	invalid address on a notifier.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 31 ++++++++++++++++------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index bc1565f1822ab..d532b468d9af5 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -852,6 +852,10 @@ static enum drm_connector_status hdmi_detect(struct drm_connector *connector,
 
 static void hdmi_connector_destroy(struct drm_connector *connector)
 {
+	struct hdmi_context *hdata = connector_to_hdmi(connector);
+
+	cec_notifier_conn_unregister(hdata->notifier);
+
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 }
@@ -935,6 +939,7 @@ static int hdmi_create_connector(struct drm_encoder *encoder)
 {
 	struct hdmi_context *hdata = encoder_to_hdmi(encoder);
 	struct drm_connector *connector = &hdata->connector;
+	struct cec_connector_info conn_info;
 	int ret;
 
 	connector->interlace_allowed = true;
@@ -957,6 +962,15 @@ static int hdmi_create_connector(struct drm_encoder *encoder)
 			DRM_DEV_ERROR(hdata->dev, "Failed to attach bridge\n");
 	}
 
+	cec_fill_conn_info_from_drm(&conn_info, connector);
+
+	hdata->notifier = cec_notifier_conn_register(hdata->dev, NULL,
+						     &conn_info);
+	if (hdata->notifier == NULL) {
+		ret = -ENOMEM;
+		DRM_DEV_ERROR(hdata->dev, "Failed to allocate CEC notifier\n");
+	}
+
 	return ret;
 }
 
@@ -1528,8 +1542,8 @@ static void hdmi_disable(struct drm_encoder *encoder)
 		 */
 		mutex_unlock(&hdata->mutex);
 		cancel_delayed_work(&hdata->hotplug_work);
-		cec_notifier_set_phys_addr(hdata->notifier,
-					   CEC_PHYS_ADDR_INVALID);
+		if (hdata->notifier)
+			cec_notifier_phys_addr_invalidate(hdata->notifier);
 		return;
 	}
 
@@ -2006,12 +2020,6 @@ static int hdmi_probe(struct platform_device *pdev)
 		}
 	}
 
-	hdata->notifier = cec_notifier_get(&pdev->dev);
-	if (hdata->notifier == NULL) {
-		ret = -ENOMEM;
-		goto err_hdmiphy;
-	}
-
 	pm_runtime_enable(dev);
 
 	audio_infoframe = &hdata->audio.infoframe;
@@ -2023,7 +2031,7 @@ static int hdmi_probe(struct platform_device *pdev)
 
 	ret = hdmi_register_audio_device(hdata);
 	if (ret)
-		goto err_notifier_put;
+		goto err_runtime_disable;
 
 	ret = component_add(&pdev->dev, &hdmi_component_ops);
 	if (ret)
@@ -2034,8 +2042,7 @@ static int hdmi_probe(struct platform_device *pdev)
 err_unregister_audio:
 	platform_device_unregister(hdata->audio.pdev);
 
-err_notifier_put:
-	cec_notifier_put(hdata->notifier);
+err_runtime_disable:
 	pm_runtime_disable(dev);
 
 err_hdmiphy:
@@ -2054,12 +2061,10 @@ static int hdmi_remove(struct platform_device *pdev)
 	struct hdmi_context *hdata = platform_get_drvdata(pdev);
 
 	cancel_delayed_work_sync(&hdata->hotplug_work);
-	cec_notifier_set_phys_addr(hdata->notifier, CEC_PHYS_ADDR_INVALID);
 
 	component_del(&pdev->dev, &hdmi_component_ops);
 	platform_device_unregister(hdata->audio.pdev);
 
-	cec_notifier_put(hdata->notifier);
 	pm_runtime_disable(&pdev->dev);
 
 	if (!IS_ERR(hdata->reg_hdmi_en))
-- 
2.23.0.rc1.153.gdeed80330f-goog

