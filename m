Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3EC83B2218
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 23 Jun 2021 22:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbhFWU54 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 23 Jun 2021 16:57:56 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:37346 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhFWU54 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 16:57:56 -0400
X-Greylist: delayed 388 seconds by postgrey-1.27 at vger.kernel.org; Wed, 23 Jun 2021 16:57:56 EDT
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru D8F4820A8BE4
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
To:     <linux-i2c@vger.kernel.org>
CC:     Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH 0/5] Correctly handle plaform_get_irq()'s result in the i2C
 drivers
Organization: Open Mobile Platform
Message-ID: <e51f8c48-a63e-57e4-ffc7-157c2534611b@omp.ru>
Date:   Wed, 23 Jun 2021 23:48:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Here are 5 patches against the 'i2c/for-current' branch of the Jens Axboe's 'linux-block.git' repo.
The affected drivers call platform_get_irq() but mis-interprete its result -- they consider
IRQ0 as error and (sometimes) the real error codes as valid IRQs... :-/

[1/5] i2c: hix5hd2: fix IRQ check
[2/5] i2c: mt65xx: fix IRQ check
[3/5] i2c: pmcmsp: fix-IRQ-check
[4/5] i2c: s3c2410: fix IRQ check
[5/5] i2c: xlp9xx: fix main IRQ check
