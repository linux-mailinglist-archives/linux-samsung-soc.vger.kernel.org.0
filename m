Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC7BB61B2
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 18 Sep 2019 12:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727653AbfIRKrF (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 18 Sep 2019 06:47:05 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56461 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727263AbfIRKrF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Sep 2019 06:47:05 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190918104703euoutp019d3c917ac501f2490103bcd3ab6b10c1~FgpWKNiQP1215812158euoutp017
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Sep 2019 10:47:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190918104703euoutp019d3c917ac501f2490103bcd3ab6b10c1~FgpWKNiQP1215812158euoutp017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1568803624;
        bh=8JclOj5/ENjUUtbfHxdc3+nnNEUeqg8O48HbeczPPFc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nAF7xZAkTVXgusag89y9aQsNW+qBUUdV53gC2WP6jx9eNugyTEuGZpNWycQT7ICR+
         lvAgJbRpbqf3xctY4RYmgY8a0Gv77mPywvNzwJU9K8fFYbUPrDMRmukVOLBv/4l4zS
         Fe1hlHTqI5JKSD6sJoBEsbx+RmaQ3q48zkrGn+T4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190918104703eucas1p2e0b96105cc5e9aeace08a4903fdb2ea4~FgpVWSc0H2473924739eucas1p2Y;
        Wed, 18 Sep 2019 10:47:03 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 10.E3.04374.62B028D5; Wed, 18
        Sep 2019 11:47:02 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190918104702eucas1p213070d06c69c4836d15d071b1926e60d~FgpUdVvec2884428844eucas1p2H;
        Wed, 18 Sep 2019 10:47:02 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190918104701eusmtrp2aa3a3018d2a40fc0a3dfcad7b543585d~FgpUNprFj1555615556eusmtrp2i;
        Wed, 18 Sep 2019 10:47:01 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-50-5d820b26ba4f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 44.2C.04117.52B028D5; Wed, 18
        Sep 2019 11:47:01 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190918104700eusmtip13d92c7a9603aa012e9bacba1e9d911ba~FgpTVgWGv0589205892eusmtip1E;
        Wed, 18 Sep 2019 10:47:00 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
        krzk@kernel.org, sbkim73@samsung.com, alsa-devel@alsa-project.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v1 5/9] ASoC: samsung: arndale: Simplify DAI link
 initialization
Date:   Wed, 18 Sep 2019 12:46:30 +0200
Message-Id: <20190918104634.15216-6-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918104634.15216-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJKsWRmVeSWpSXmKPExsWy7djP87pq3E2xBtt6dS2uXDzEZLFxxnpW
        i6kPn7BZXGndxGgx/8g5Vovz5zewW3y70sFksenxNVaLGef3MVmsPXKX3eLz+/2sFq17j7Bb
        HH7TzmpxccUXJgc+jw2fm9g8ds66y+6xaVUnm8fmJfUe0+f8Z/To27KK0ePzJrkA9igum5TU
        nMyy1CJ9uwSujBO3NrAX9ItWPJmn3MD4SLCLkZNDQsBEYt70zcxdjFwcQgIrGCU2/t3PCOF8
        YZR4e/sdC4TzmVFi2ZGzLDAt+w89YINILGeUaDv4gB2u5fuSM6wgVWwChhK9R/sYQWwRATGJ
        23M6wZYwC/xhknj7dxbYKGGBIIlvz5cygdgsAqoSH9ZfAGvgFbCW2LbzCBvEOnmJ1RsOMIPY
        nAI2Ep8uPAC7SUJgG7vE3Qu9UEUuEnMfLmOFsIUlXh3fwg5hy0j83zmfCaKhmVGiZ/dtdghn
        AqPE/eMLGCGqrCUOH78I1M0BdJ+mxPpd+hBhR4nlr9czg4QlBPgkbrwFBxkzkDlp23SoMK9E
        R5sQRLWKxO9V05kgbCmJ7if/ocHlIXG45Tk0hPqBtv6ezTqBUX4WwrIFjIyrGMVTS4tz01OL
        jfNSy/WKE3OLS/PS9ZLzczcxAhPQ6X/Hv+5g3Pcn6RCjAAejEg+vxNmGWCHWxLLiytxDjBIc
        zEoivAG19bFCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeasZHkQLCaQnlqRmp6YWpBbBZJk4OKUa
        GG8tY2qwWLhJWaGzSP9Sb2J9edQFf903KtYdwb/+Za1oKQidWizw00StXst70g+GuBlzXD5E
        u01bs/jjXOt36/b/du2dv5Pn8cs/W5KuFdavsA+fyOaRZqBTUHxwvZuCZbfdQuH6Sl5pnVWc
        h38VbT98s4o/dcGuydNlJpkmfzgaG9gvNLdnkhJLcUaioRZzUXEiAPOSki08AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42I5/e/4XV1V7qZYg9btShZXLh5istg4Yz2r
        xdSHT9gsrrRuYrSYf+Qcq8X58xvYLb5d6WCy2PT4GqvFjPP7mCzWHrnLbvH5/X5Wi9a9R9gt
        Dr9pZ7W4uOILkwOfx4bPTWweO2fdZffYtKqTzWPzknqP6XP+M3r0bVnF6PF5k1wAe5SeTVF+
        aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexolbG9gL+kUr
        nsxTbmB8JNjFyMkhIWAisf/QA7YuRi4OIYGljBIHZu5n7GLkAEpIScxvUYKoEZb4c60LquYT
        o8ScDyuYQBJsAoYSvUf7GEFsEQExidtzOplBipgFupgl3u/4xQqSEBYIkJi84jYbiM0ioCrx
        Yf0FsAZeAWuJbTuPsEFskJdYveEAM4jNKWAj8enCAxYQWwioZsGxaYwTGPkWMDKsYhRJLS3O
        Tc8tNtIrTswtLs1L10vOz93ECIyFbcd+btnB2PUu+BCjAAejEg+vxNmGWCHWxLLiytxDjBIc
        zEoivAG19bFCvCmJlVWpRfnxRaU5qcWHGE2BjprILCWanA+M07ySeENTQ3MLS0NzY3NjMwsl
        cd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYxLDL6yn8yXuMl/f0Xqp8zTUsXiUyUWScw/X7bC
        /PQ32yuJ8habo2SYmV/uzpqUtiJN6fm7vCcZ0+bKn/2WpaAubzBh73PdT3vMvy9bLj1J2tWX
        /1NDzazA2iTxB8XCNq/nuq72MQoPKMtvnSN/wm693k6m9HlzpMM+6V7Wnrpf76zYTpOo7HAl
        luKMREMt5qLiRAANYwJMmwIAAA==
X-CMS-MailID: 20190918104702eucas1p213070d06c69c4836d15d071b1926e60d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190918104702eucas1p213070d06c69c4836d15d071b1926e60d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190918104702eucas1p213070d06c69c4836d15d071b1926e60d
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
        <CGME20190918104702eucas1p213070d06c69c4836d15d071b1926e60d@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

There is only one DAI link so we can drop an unnecessary loop statement.
Use card->dai_link in place of direct static arndale_rt5631_dai[] array
dereference as a prerequisite for adding support for other CODECs.
Unnecessary assignment of dai_link->codecs->name to NULL is removed.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/arndale_rt5631.c | 42 ++++++++++++------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/sound/soc/samsung/arndale_rt5631.c b/sound/soc/samsung/arndale_rt5631.c
index c213913eb984..c5c8e3b5772f 100644
--- a/sound/soc/samsung/arndale_rt5631.c
+++ b/sound/soc/samsung/arndale_rt5631.c
@@ -76,41 +76,33 @@ static struct snd_soc_card arndale_rt5631 = {
 
 static int arndale_audio_probe(struct platform_device *pdev)
 {
-	int n, ret;
 	struct device_node *np = pdev->dev.of_node;
 	struct snd_soc_card *card = &arndale_rt5631;
+	struct snd_soc_dai_link *dai_link;
+	int ret;
 
 	card->dev = &pdev->dev;
+	dai_link = card->dai_link;
 
-	for (n = 0; np && n < ARRAY_SIZE(arndale_rt5631_dai); n++) {
-		if (!arndale_rt5631_dai[n].cpus->dai_name) {
-			arndale_rt5631_dai[n].cpus->of_node = of_parse_phandle(np,
-					"samsung,audio-cpu", n);
-
-			if (!arndale_rt5631_dai[n].cpus->of_node) {
-				dev_err(&pdev->dev,
-				"Property 'samsung,audio-cpu' missing or invalid\n");
-				return -EINVAL;
-			}
-		}
-		if (!arndale_rt5631_dai[n].platforms->name)
-			arndale_rt5631_dai[n].platforms->of_node =
-					arndale_rt5631_dai[n].cpus->of_node;
-
-		arndale_rt5631_dai[n].codecs->name = NULL;
-		arndale_rt5631_dai[n].codecs->of_node = of_parse_phandle(np,
-					"samsung,audio-codec", n);
-		if (!arndale_rt5631_dai[0].codecs->of_node) {
-			dev_err(&pdev->dev,
-			"Property 'samsung,audio-codec' missing or invalid\n");
+	dai_link->cpus->of_node = of_parse_phandle(np, "samsung,audio-cpu", 0);
+	if (!dai_link->cpus->of_node) {
+		dev_err(&pdev->dev, "Property 'samsung,audio-cpu' missing or invalid\n");
 			return -EINVAL;
-		}
 	}
 
-	ret = devm_snd_soc_register_card(card->dev, card);
+	if (!dai_link->platforms->name)
+		dai_link->platforms->of_node = dai_link->cpus->of_node;
+
+	dai_link->codecs->of_node = of_parse_phandle(np, "samsung,audio-codec", 0);
+	if (!dai_link->codecs->of_node) {
+		dev_err(&pdev->dev,
+			"Property 'samsung,audio-codec' missing or invalid\n");
+		return -EINVAL;
+	}
 
+	ret = devm_snd_soc_register_card(card->dev, card);
 	if (ret)
-		dev_err(&pdev->dev, "snd_soc_register_card() failed:%d\n", ret);
+		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n", ret);
 
 	return ret;
 }
-- 
2.17.1

