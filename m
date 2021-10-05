Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34850422D74
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  5 Oct 2021 18:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235077AbhJEQLQ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 5 Oct 2021 12:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235875AbhJEQLP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 12:11:15 -0400
Received: from mail.marcansoft.com (marcansoft.com [IPv6:2a01:298:fe:f::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB40CC061753;
        Tue,  5 Oct 2021 09:09:24 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: hector@marcansoft.com)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 5C0CF3FA5E;
        Tue,  5 Oct 2021 15:59:56 +0000 (UTC)
From:   Hector Martin <marcan@marcan.st>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Hector Martin <marcan@marcan.st>, Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH 3/7] soc: apple: Add driver for Apple PMGR power state controls
Date:   Wed,  6 Oct 2021 00:59:19 +0900
Message-Id: <20211005155923.173399-4-marcan@marcan.st>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211005155923.173399-1-marcan@marcan.st>
References: <20211005155923.173399-1-marcan@marcan.st>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Implements genpd and reset providers for downstream devices. Each
instance of the driver binds to a single register and represents a
single SoC power domain.

The driver does not currently implement all features (auto-pm,
clockgate-only state), but we declare the respective registers for
documentation purposes. These features will be added as they become
useful for downstream devices.

This also creates the apple/soc tree and Kconfig submenu.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 MAINTAINERS                             |   1 +
 drivers/soc/Kconfig                     |   1 +
 drivers/soc/Makefile                    |   1 +
 drivers/soc/apple/Kconfig               |  21 ++
 drivers/soc/apple/Makefile              |   2 +
 drivers/soc/apple/apple-pmgr-pwrstate.c | 281 ++++++++++++++++++++++++
 6 files changed, 307 insertions(+)
 create mode 100644 drivers/soc/apple/Kconfig
 create mode 100644 drivers/soc/apple/Makefile
 create mode 100644 drivers/soc/apple/apple-pmgr-pwrstate.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5fe53d9a2956..def5e05da2bc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1725,6 +1725,7 @@ F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/irqchip/irq-apple-aic.c
+F:	drivers/soc/apple/*
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
 
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index e8a30c4c5aec..a8562678c437 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -3,6 +3,7 @@ menu "SOC (System On Chip) specific Drivers"
 
 source "drivers/soc/actions/Kconfig"
 source "drivers/soc/amlogic/Kconfig"
+source "drivers/soc/apple/Kconfig"
 source "drivers/soc/aspeed/Kconfig"
 source "drivers/soc/atmel/Kconfig"
 source "drivers/soc/bcm/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index a05e9fbcd3e0..adb30c2d4fea 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -4,6 +4,7 @@
 #
 
 obj-$(CONFIG_ARCH_ACTIONS)	+= actions/
+obj-$(CONFIG_ARCH_APPLE)	+= apple/
 obj-y				+= aspeed/
 obj-$(CONFIG_ARCH_AT91)		+= atmel/
 obj-y				+= bcm/
diff --git a/drivers/soc/apple/Kconfig b/drivers/soc/apple/Kconfig
new file mode 100644
index 000000000000..271092b6aee7
--- /dev/null
+++ b/drivers/soc/apple/Kconfig
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+if ARCH_APPLE || COMPILE_TEST
+
+menu "Apple SoC drivers"
+
+config APPLE_PMGR_PWRSTATE
+	tristate "Apple SoC PMGR power state control"
+	select REGMAP
+	select MFD_SYSCON
+	select PM_GENERIC_DOMAINS
+	select RESET_CONTROLLER
+	default ARCH_APPLE
+	help
+	  The PMGR block in Apple SoCs provides high-level power state
+	  controls for SoC devices. This driver manages them through the
+	  generic power domain framework, and also provides reset support.
+
+endmenu
+
+endif
diff --git a/drivers/soc/apple/Makefile b/drivers/soc/apple/Makefile
new file mode 100644
index 000000000000..c114e84667e4
--- /dev/null
+++ b/drivers/soc/apple/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_APPLE_PMGR_PWRSTATE)	+= apple-pmgr-pwrstate.o
diff --git a/drivers/soc/apple/apple-pmgr-pwrstate.c b/drivers/soc/apple/apple-pmgr-pwrstate.c
new file mode 100644
index 000000000000..a0338dbb29b8
--- /dev/null
+++ b/drivers/soc/apple/apple-pmgr-pwrstate.c
@@ -0,0 +1,281 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SoC PMGR device power state driver
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include <linux/bitops.h>
+#include <linux/bitfield.h>
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+#include <linux/reset-controller.h>
+#include <linux/module.h>
+
+#define APPLE_PMGR_RESET        BIT(31)
+#define APPLE_PMGR_AUTO_ENABLE  BIT(28)
+#define APPLE_PMGR_PS_AUTO      GENMASK(27, 24)
+#define APPLE_PMGR_PARENT_OFF   BIT(11)
+#define APPLE_PMGR_DEV_DISABLE  BIT(10)
+#define APPLE_PMGR_WAS_CLKGATED BIT(9)
+#define APPLE_PMGR_WAS_PWRGATED BIT(8)
+#define APPLE_PMGR_PS_ACTUAL    GENMASK(7, 4)
+#define APPLE_PMGR_PS_TARGET    GENMASK(3, 0)
+
+#define APPLE_PMGR_PS_ACTIVE    0xf
+#define APPLE_PMGR_PS_CLKGATE   0x4
+#define APPLE_PMGR_PS_PWRGATE   0x0
+
+#define APPLE_PMGR_PS_SET_TIMEOUT 100
+#define APPLE_PMGR_RESET_TIME 1
+
+struct apple_pmgr_ps {
+	struct device *dev;
+	struct generic_pm_domain genpd;
+	struct reset_controller_dev rcdev;
+	struct regmap *regmap;
+	u32 offset;
+};
+
+#define genpd_to_apple_pmgr_ps(_genpd) container_of(_genpd, struct apple_pmgr_ps, genpd)
+#define rcdev_to_apple_pmgr_ps(_rcdev) container_of(_rcdev, struct apple_pmgr_ps, rcdev)
+
+static int apple_pmgr_ps_set(struct generic_pm_domain *genpd, u32 pstate)
+{
+	int ret;
+	struct apple_pmgr_ps *ps = genpd_to_apple_pmgr_ps(genpd);
+	u32 reg;
+
+	regmap_read(ps->regmap, ps->offset, &reg);
+
+	/* Resets are synchronous, and only work if the device is powered and clocked. */
+	if (reg & APPLE_PMGR_RESET && pstate != APPLE_PMGR_PS_ACTIVE)
+		dev_err(ps->dev, "PS 0x%x: powering off with RESET active\n", ps->offset);
+
+	reg &= ~(APPLE_PMGR_AUTO_ENABLE | APPLE_PMGR_WAS_CLKGATED | APPLE_PMGR_WAS_PWRGATED |
+		 APPLE_PMGR_PS_TARGET);
+	reg |= FIELD_PREP(APPLE_PMGR_PS_TARGET, pstate);
+
+	dev_dbg(ps->dev, "PS 0x%x: pwrstate = 0x%x: 0x%x\n", ps->offset, pstate, reg);
+
+	regmap_write(ps->regmap, ps->offset, reg);
+
+	ret = regmap_read_poll_timeout_atomic(
+		ps->regmap, ps->offset, reg,
+		(FIELD_GET(APPLE_PMGR_PS_ACTUAL, reg) == pstate), 1,
+		APPLE_PMGR_PS_SET_TIMEOUT);
+	if (ret < 0)
+		dev_err(ps->dev, "PS 0x%x: Failed to reach power state 0x%x (now: 0x%x)\n",
+			ps->offset, pstate, reg);
+	return ret;
+}
+
+static bool apple_pmgr_ps_is_active(struct apple_pmgr_ps *ps)
+{
+	u32 reg;
+
+	regmap_read(ps->regmap, ps->offset, &reg);
+	return FIELD_GET(APPLE_PMGR_PS_ACTUAL, reg) == APPLE_PMGR_PS_ACTIVE;
+}
+
+static int apple_pmgr_ps_power_on(struct generic_pm_domain *genpd)
+{
+	return apple_pmgr_ps_set(genpd, APPLE_PMGR_PS_ACTIVE);
+}
+
+static int apple_pmgr_ps_power_off(struct generic_pm_domain *genpd)
+{
+	return apple_pmgr_ps_set(genpd, APPLE_PMGR_PS_PWRGATE);
+}
+
+static int apple_pmgr_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct apple_pmgr_ps *ps = rcdev_to_apple_pmgr_ps(rcdev);
+
+	mutex_lock(&ps->genpd.mlock);
+
+	if (ps->genpd.status == GENPD_STATE_OFF)
+		dev_err(ps->dev, "PS 0x%x: asserting RESET while powered down\n", ps->offset);
+
+	dev_dbg(ps->dev, "PS 0x%x: assert reset\n", ps->offset);
+	/* Quiesce device before asserting reset */
+	regmap_set_bits(ps->regmap, ps->offset, APPLE_PMGR_DEV_DISABLE);
+	regmap_set_bits(ps->regmap, ps->offset, APPLE_PMGR_RESET);
+
+	mutex_unlock(&ps->genpd.mlock);
+
+	return 0;
+}
+
+static int apple_pmgr_reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct apple_pmgr_ps *ps = rcdev_to_apple_pmgr_ps(rcdev);
+
+	mutex_lock(&ps->genpd.mlock);
+
+	dev_dbg(ps->dev, "PS 0x%x: deassert reset\n", ps->offset);
+	regmap_clear_bits(ps->regmap, ps->offset, APPLE_PMGR_RESET);
+	regmap_clear_bits(ps->regmap, ps->offset, APPLE_PMGR_DEV_DISABLE);
+
+	if (ps->genpd.status == GENPD_STATE_OFF)
+		dev_err(ps->dev, "PS 0x%x: RESET was deasserted while powered down\n", ps->offset);
+
+	mutex_unlock(&ps->genpd.mlock);
+
+	return 0;
+}
+
+static int apple_pmgr_reset_reset(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	int ret;
+
+	ret = apple_pmgr_reset_assert(rcdev, id);
+	if (ret)
+		return ret;
+
+	usleep_range(APPLE_PMGR_RESET_TIME, 2 * APPLE_PMGR_RESET_TIME);
+
+	return apple_pmgr_reset_deassert(rcdev, id);
+}
+
+static int apple_pmgr_reset_status(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct apple_pmgr_ps *ps = rcdev_to_apple_pmgr_ps(rcdev);
+	u32 reg;
+
+	regmap_read(ps->regmap, ps->offset, &reg);
+
+	return !!(reg & APPLE_PMGR_RESET);
+}
+
+const struct reset_control_ops apple_pmgr_reset_ops = {
+	.assert		= apple_pmgr_reset_assert,
+	.deassert	= apple_pmgr_reset_deassert,
+	.reset		= apple_pmgr_reset_reset,
+	.status		= apple_pmgr_reset_status,
+};
+
+static int apple_pmgr_reset_xlate(struct reset_controller_dev *rcdev,
+				  const struct of_phandle_args *reset_spec)
+{
+	return 0;
+}
+
+static int apple_pmgr_ps_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
+	struct apple_pmgr_ps *ps;
+	struct regmap *regmap;
+	struct of_phandle_iterator it;
+	int ret;
+	const char *name;
+
+	regmap = syscon_node_to_regmap(node->parent);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	ps = devm_kzalloc(dev, sizeof(*ps), GFP_KERNEL);
+	if (!ps)
+		return -ENOMEM;
+
+	ps->dev = dev;
+	ps->regmap = regmap;
+
+	ret = of_property_read_string(node, "apple,domain-name", &name);
+	if (ret < 0) {
+		dev_err(dev, "missing apple,domain-name property\n");
+		return ret;
+	}
+
+	ret = of_property_read_u32(node, "reg", &ps->offset);
+	if (ret < 0) {
+		dev_err(dev, "missing reg property\n");
+		return ret;
+	}
+
+	if (of_property_read_bool(node, "apple,always-on"))
+		ps->genpd.flags |= GENPD_FLAG_ALWAYS_ON;
+
+	ps->genpd.name = name;
+	ps->genpd.power_on = apple_pmgr_ps_power_on;
+	ps->genpd.power_off = apple_pmgr_ps_power_off;
+
+	ret = pm_genpd_init(&ps->genpd, NULL, !apple_pmgr_ps_is_active(ps));
+	if (ret < 0) {
+		dev_err(dev, "pm_genpd_init failed\n");
+		return ret;
+	}
+
+	ret = of_genpd_add_provider_simple(node, &ps->genpd);
+	if (ret < 0) {
+		dev_err(dev, "of_genpd_add_provider_simple failed\n");
+		return ret;
+	}
+
+	of_for_each_phandle(&it, ret, node, "power-domains", "#power-domain-cells", -1) {
+		struct of_phandle_args parent, child;
+
+		parent.np = it.node;
+		parent.args_count = of_phandle_iterator_args(&it, parent.args, MAX_PHANDLE_ARGS);
+		child.np = node;
+		child.args_count = 0;
+		ret = of_genpd_add_subdomain(&parent, &child);
+
+		if (ret == -EPROBE_DEFER) {
+			of_node_put(parent.np);
+			goto err_remove;
+		} else if (ret < 0) {
+			dev_err(dev, "failed to add to parent domain: %d (%s -> %s)\n",
+				ret, it.node->name, node->name);
+			of_node_put(parent.np);
+			goto err_remove;
+		}
+	}
+
+	pm_genpd_remove_device(dev);
+
+	ps->rcdev.owner = THIS_MODULE;
+	ps->rcdev.nr_resets = 1;
+	ps->rcdev.ops = &apple_pmgr_reset_ops;
+	ps->rcdev.of_node = dev->of_node;
+	ps->rcdev.of_reset_n_cells = 0;
+	ps->rcdev.of_xlate = apple_pmgr_reset_xlate;
+
+	ret = devm_reset_controller_register(dev, &ps->rcdev);
+	if (ret < 0)
+		goto err_remove;
+
+	return 0;
+err_remove:
+	of_genpd_del_provider(node);
+	pm_genpd_remove(&ps->genpd);
+	return ret;
+}
+
+static const struct of_device_id apple_pmgr_ps_of_match[] = {
+	{ .compatible = "apple,t8103-pmgr-pwrstate" },
+	{ .compatible = "apple,pmgr-pwrstate" },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, apple_pmgr_ps_of_match);
+
+static struct platform_driver apple_pmgr_ps_driver = {
+	.probe = apple_pmgr_ps_probe,
+	.driver = {
+		.name = "apple-pmgr-pwrstate",
+		.of_match_table = apple_pmgr_ps_of_match,
+	},
+};
+
+MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
+MODULE_DESCRIPTION("PMGR power state driver for Apple SoCs");
+MODULE_LICENSE("GPL v2");
+
+module_platform_driver(apple_pmgr_ps_driver);
-- 
2.33.0

