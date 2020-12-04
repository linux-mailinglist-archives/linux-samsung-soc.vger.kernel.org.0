Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 578D62CF1DE
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  4 Dec 2020 17:27:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730547AbgLDQ1A (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 4 Dec 2020 11:27:00 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:39184 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726928AbgLDQ07 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 11:26:59 -0500
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id BD3323B608C
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Dec 2020 16:26:17 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 3FF331BF205;
        Fri,  4 Dec 2020 16:25:14 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Arnd Bergmann <arnd@kernel.org>, linux-mtd@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [for NAND] ARM: s3c: gta02: fix for missing linux/mtd/nand_ecc.h
Date:   Fri,  4 Dec 2020 17:25:13 +0100
Message-Id: <20201204162513.1142-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201204161137.2729220-1-arnd@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 7a26863a23e4fbfee040f8c8c5fdce0419dc0920
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 2020-12-04 at 16:10:12 UTC, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The header file got renamed, so any file including it needs to
> be adapted to avoid:
> 
> arch/arm/mach-s3c/mach-gta02.c:40:10: fatal error: 'linux/mtd/nand_ecc.h' file not found
> 
> Fixes: 3f27bb3e3777 ("mtd: nand: ecc-hamming: Move Hamming code to the generic NAND layer")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
