Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2B3D32B4
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 10 Oct 2019 22:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbfJJUoz (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 10 Oct 2019 16:44:55 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:56031 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726584AbfJJUoy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Oct 2019 16:44:54 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1Mth79-1hws9N0RtH-00v9BF; Thu, 10 Oct 2019 22:44:02 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org,
        Arnd Bergmann <arnd@arndb.de>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 19/36] ARM: s3c: rx1950: turn into platform driver
Date:   Thu, 10 Oct 2019 22:30:03 +0200
Message-Id: <20191010203043.1241612-19-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191010203043.1241612-1-arnd@arndb.de>
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wfNbW16IH/8q0rLeY8IHyXf66LWIWC8U3pThkVQcSDrkHT31+9v
 vSxG8oSXg+CP7yr/A/jTn4vRfKsNKGDB58f5hbPDeSbi5tQFy8/rxaJ4N0q5Ao2RUOW8n2+
 3wifuIaYS+qoAW8vLs1Il0nTgvTWpHRB+vHi0pS5wN5bCNJA7pZX6OPbCylScrja8E45VCv
 7dzBwEvwMlK5gs3JSLAwA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ILRXTWnhcB0=:dRAmk3oj1xyGKWAyP6W5pO
 +luDe78DLJdlKnkY66ohF9u+xItRim55TUBkC9+whJGE51aCh3+hVKj0nB1ZwMugTPJl3s8lj
 jFbaR6RhlfDgfYYm302LGcl2l8yhPqP26XpB343ZyuiIKBjM72WJ3jh+rij/VsLu3UOey0SfP
 9fk1ALHICmY//RWOqQ25ypM52eXD4bUz3QhR5ugDZwMswGWexJs5LwNZy6s+Jsr02L8MQCYSv
 NcxsR3W/LFTx41U2g4UXT1HVLFmz6SUn1ywigup8+Hmc039sa9yyKHM5LyNv6xhmVg7/MPbt0
 aLFpiKltf0EeI4+AQKLWV3nYdOv7/xp0oFn6BTvOIMzVbXn1CmLweoI6pWdMaMUNIRjQmNSft
 PSZlAMME0FCN7GiCAsWMwfX50FFgyG2EqPZ6FSLQfxlgUKJBzkms4JtpcZSslos54uILvhNoX
 Fu+pssdbfj0EPlK2udsNZfxYpKbq0ALaVht0aAnS9YFpUqcnS9HZymWN3RpmEWw6UYNl041gy
 tCMttOB8ZY/YvgN349VbrY5jlktb7TjZ2FMoqlXqppPGAL0hmZh7p8jIGxzRyWwie+rsKbdux
 qCV3usmIB5IlWaxTGDaVNydNKiR/T/7EBkJyXbA6Xuvs9aJrFXAWedRF9h43/3DoIXB34doDI
 AFa7l9hwJDVQ0ATfHogkZJBXfAEc15QEddIjt/LMCNKTbr8xTIibld/fBl8D6EG1RkTCU8cG0
 iWolX3DGh7NjJWw0XwN/mU9g5Rw0/pSXzp0GO1k2cvl+5LFFSTlsSvQFTSC/6ZYIfLFOUMo1q
 AVcDENybVASfwb+I7NPpxah1QVFB8csB9FycNVTN9wvuQkgZz8wYDELxDy5SyaG98aTBJ+fUc
 7buRF937lbAWyt64ZNPQ==
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Avoid machine specific headers by using a gpio lookup table
combined with a platform_driver for this board.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-s3c24xx/mach-rx1950.c | 16 +++++++
 sound/soc/samsung/rx1950_uda1380.c  | 72 +++++++++--------------------
 2 files changed, 39 insertions(+), 49 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-rx1950.c b/arch/arm/mach-s3c24xx/mach-rx1950.c
index 29f9b345a531..9f3b0f18cd36 100644
--- a/arch/arm/mach-s3c24xx/mach-rx1950.c
+++ b/arch/arm/mach-s3c24xx/mach-rx1950.c
@@ -724,6 +724,20 @@ static struct i2c_board_info rx1950_i2c_devices[] = {
 	},
 };
 
+static struct gpiod_lookup_table rx1950_audio_gpio_table = {
+	.dev_id = "rx1950-audio",
+	.table = {
+		GPIO_LOOKUP("GPIOG", 12, "hp-gpio", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("GPIOA", 1, "speaker-power", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
+static struct platform_device rx1950_audio = {
+	.name = "rx1950-audio",
+	.id = -1,
+};
+
 static struct platform_device *rx1950_devices[] __initdata = {
 	&s3c2410_device_dclk,
 	&s3c_device_lcd,
@@ -742,6 +756,7 @@ static struct platform_device *rx1950_devices[] __initdata = {
 	&power_supply,
 	&rx1950_battery,
 	&rx1950_leds,
+	&rx1950_audio,
 };
 
 static void __init rx1950_map_io(void)
@@ -809,6 +824,7 @@ static void __init rx1950_init_machine(void)
 	gpio_direction_output(S3C2410_GPJ(6), 0);
 
 	pwm_add_table(rx1950_pwm_lookup, ARRAY_SIZE(rx1950_pwm_lookup));
+	gpiod_add_lookup_table(&rx1950_audio_gpio_table);
 	platform_add_devices(rx1950_devices, ARRAY_SIZE(rx1950_devices));
 
 	i2c_register_board_info(0, rx1950_i2c_devices,
diff --git a/sound/soc/samsung/rx1950_uda1380.c b/sound/soc/samsung/rx1950_uda1380.c
index 4b247e91ae5b..cf96eaaf6b4e 100644
--- a/sound/soc/samsung/rx1950_uda1380.c
+++ b/sound/soc/samsung/rx1950_uda1380.c
@@ -12,16 +12,13 @@
 //          Vasily Khoruzhick <anarsoul@gmail.com>
 
 #include <linux/types.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 
 #include <sound/soc.h>
 #include <sound/jack.h>
 
-#include <mach/gpio-samsung.h>
 #include "regs-iis.h"
-#include <asm/mach-types.h>
-
 #include "s3c24xx-i2s.h"
 
 static int rx1950_uda1380_init(struct snd_soc_pcm_runtime *rtd);
@@ -58,7 +55,6 @@ static struct snd_soc_jack_pin hp_jack_pins[] = {
 
 static struct snd_soc_jack_gpio hp_jack_gpios[] = {
 	[0] = {
-		.gpio			= S3C2410_GPG(12),
 		.name			= "hp-gpio",
 		.report			= SND_JACK_HEADPHONE,
 		.invert			= 1,
@@ -123,8 +119,6 @@ static struct snd_soc_card rx1950_asoc = {
 	.num_dapm_routes = ARRAY_SIZE(audio_map),
 };
 
-static struct platform_device *s3c24xx_snd_device;
-
 static int rx1950_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -134,13 +128,15 @@ static int rx1950_startup(struct snd_pcm_substream *substream)
 					&hw_rates);
 }
 
+struct gpio_desc *gpiod_speaker_power;
+
 static int rx1950_spk_power(struct snd_soc_dapm_widget *w,
 				struct snd_kcontrol *kcontrol, int event)
 {
 	if (SND_SOC_DAPM_EVENT_ON(event))
-		gpio_set_value(S3C2410_GPA(1), 1);
+		gpiod_set_value(gpiod_speaker_power, 1);
 	else
-		gpio_set_value(S3C2410_GPA(1), 0);
+		gpiod_set_value(gpiod_speaker_power, 0);
 
 	return 0;
 }
@@ -214,57 +210,35 @@ static int rx1950_uda1380_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
-static int __init rx1950_init(void)
+static int rx1950_probe(struct platform_device *pdev)
 {
-	int ret;
-
-	if (!machine_is_rx1950())
-		return -ENODEV;
+	struct device *dev = &pdev->dev;
 
 	/* configure some gpios */
-	ret = gpio_request(S3C2410_GPA(1), "speaker-power");
-	if (ret)
-		goto err_gpio;
-
-	ret = gpio_direction_output(S3C2410_GPA(1), 0);
-	if (ret)
-		goto err_gpio_conf;
-
-	s3c24xx_snd_device = platform_device_alloc("soc-audio", -1);
-	if (!s3c24xx_snd_device) {
-		ret = -ENOMEM;
-		goto err_plat_alloc;
-	}
-
-	platform_set_drvdata(s3c24xx_snd_device, &rx1950_asoc);
-	ret = platform_device_add(s3c24xx_snd_device);
-
-	if (ret) {
-		platform_device_put(s3c24xx_snd_device);
-		goto err_plat_add;
+	gpiod_speaker_power = devm_gpiod_get(dev, "speaker-power", GPIOD_OUT_LOW);
+	if (IS_ERR(gpiod_speaker_power)) {
+		dev_err(dev, "cannot get gpio\n");
+		return PTR_ERR(gpiod_speaker_power);
 	}
 
-	return 0;
-
-err_plat_add:
-err_plat_alloc:
-err_gpio_conf:
-	gpio_free(S3C2410_GPA(1));
+	hp_jack_gpios[0].gpiod_dev = dev;
+	rx1950_asoc.dev = dev;
 
-err_gpio:
-	return ret;
+	return devm_snd_soc_register_card(dev, &rx1950_asoc);
 }
 
-static void __exit rx1950_exit(void)
-{
-	platform_device_unregister(s3c24xx_snd_device);
-	gpio_free(S3C2410_GPA(1));
-}
+struct platform_driver rx1950_audio = {
+	.driver = {
+		.name = "rx1950-audio",
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = rx1950_probe,
+};
 
-module_init(rx1950_init);
-module_exit(rx1950_exit);
+module_platform_driver(rx1950_audio);
 
 /* Module information */
 MODULE_AUTHOR("Vasily Khoruzhick");
 MODULE_DESCRIPTION("ALSA SoC RX1950");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:rx1950-audio");
-- 
2.20.0

