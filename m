Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 487A010E321
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  1 Dec 2019 19:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbfLAS3l (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 1 Dec 2019 13:29:41 -0500
Received: from mtax.cdmx.gob.mx ([187.141.35.197]:14583 "EHLO mtax.cdmx.gob.mx"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727297AbfLAS3l (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 1 Dec 2019 13:29:41 -0500
X-Greylist: delayed 7140 seconds by postgrey-1.27 at vger.kernel.org; Sun, 01 Dec 2019 13:29:41 EST
X-NAI-Header: Modified by McAfee Email Gateway (4500)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cdmx.gob.mx; s=72359050-3965-11E6-920A-0192F7A2F08E;
        t=1575217654; h=DKIM-Filter:X-Virus-Scanned:
         Content-Type:MIME-Version:Content-Transfer-Encoding:
         Content-Description:Subject:To:From:Date:Message-Id:
         X-AnalysisOut:X-AnalysisOut:X-AnalysisOut:
         X-AnalysisOut:X-AnalysisOut:X-SAAS-TrackingID:
         X-NAI-Spam-Flag:X-NAI-Spam-Threshold:X-NAI-Spam-Score:
         X-NAI-Spam-Rules:X-NAI-Spam-Version; bh=M
        8rWdUYQ57RAYAgTWJQ4Rsch0kO0UXllaAVDzocOs4
        8=; b=YpfZyxm/N30xRDnpuh7NDbDrJ9s8Hw4VBiag+xKA5qVu
        EX9wIF/3WyzFOHpq5P343L10bUMpnURbbmaJUtFC9LTQzY4JeZ
        Pvc5aeIXHnNeXwO5RiT0gwpsndeByQoFOE9+js/gsPcY7tglr+
        XSMPSKfv6bEsNz0LHFLDBO4LVQc=
Received: from cdmx.gob.mx (correo.cdmx.gob.mx [10.250.108.150]) by mtax.cdmx.gob.mx with smtp
        (TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-GCM-SHA384)
         id 28cd_481f_e8da9f6f_5ea2_494a_8b2e_dcb2ae55a5a2;
        Sun, 01 Dec 2019 10:27:33 -0600
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id 36E7F1E2F65;
        Sun,  1 Dec 2019 10:18:53 -0600 (CST)
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id edp_mqrRyrLy; Sun,  1 Dec 2019 10:18:53 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id 166151E2878;
        Sun,  1 Dec 2019 10:14:16 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.9.2 cdmx.gob.mx 166151E2878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cdmx.gob.mx;
        s=72359050-3965-11E6-920A-0192F7A2F08E; t=1575216856;
        bh=M8rWdUYQ57RAYAgTWJQ4Rsch0kO0UXllaAVDzocOs48=;
        h=Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:
         From:Date:Message-Id;
        b=hv7xCZT9wXPKAModjl4TKiSSbcI7NwyQ9A9xf+dPTK8TxrRJLnFoIaSlEkgZcOWJC
         VLwvIlP/SwNniZQ0V2LhBI+38nzEWLybeMcFHCAl3UJEj7ZKdhsDDGDJJZX6ZK+4Bo
         Ku1Yj2hEJrftHlNgZzP78pVqglpHfn1fnGNhD724=
X-Virus-Scanned: amavisd-new at cdmx.gob.mx
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id SMRi2REh1kRG; Sun,  1 Dec 2019 10:14:16 -0600 (CST)
Received: from [192.168.0.104] (unknown [188.125.168.160])
        by cdmx.gob.mx (Postfix) with ESMTPSA id 06C101E2E2B;
        Sun,  1 Dec 2019 10:05:13 -0600 (CST)
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Congratulations
To:     Recipients <aac-styfe@cdmx.gob.mx>
From:   "Bishop Johnr" <aac-styfe@cdmx.gob.mx>
Date:   Sun, 01 Dec 2019 17:05:05 +0100
Message-Id: <20191201160514.06C101E2E2B@cdmx.gob.mx>
X-AnalysisOut: [v=2.2 cv=HeFkdmM8 c=1 sm=1 tr=0 p=6K-Ig8iNAUou4E5wYCEA:9 p]
X-AnalysisOut: [=zRI05YRXt28A:10 a=T6zFoIZ12MK39YzkfxrL7A==:117 a=9152RP8M]
X-AnalysisOut: [6GQqDhC/mI/QXQ==:17 a=8nJEP1OIZ-IA:10 a=pxVhFHJ0LMsA:10 a=]
X-AnalysisOut: [pGLkceISAAAA:8 a=wPNLvfGTeEIA:10 a=M8O0W8wq6qAA:10 a=Ygvjr]
X-AnalysisOut: [iKHvHXA2FhpO6d-:22]
X-SAAS-TrackingID: 3f9e3ed5.0.23902149.00-2363.40384686.s12p02m002.mxlogic.net
X-NAI-Spam-Flag: NO
X-NAI-Spam-Threshold: 3
X-NAI-Spam-Score: -5000
X-NAI-Spam-Rules: 1 Rules triggered
        WHITELISTED=-5000
X-NAI-Spam-Version: 2.3.0.9418 : core <6686> : inlines <7165> : streams
 <1840193> : uri <2949750>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Money was donated to you by Mr and Mrs Allen and Violet Large, just contact=
 them with this email for more information =


EMail: allenandvioletlargeaward@gmail.com
