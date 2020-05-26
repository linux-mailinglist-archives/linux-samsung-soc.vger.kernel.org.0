Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 353AA1CF46F
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 12 May 2020 14:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729583AbgELMcn (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 12 May 2020 08:32:43 -0400
Received: from mout.web.de ([212.227.17.12]:60069 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729408AbgELMcm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 May 2020 08:32:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1589286744;
        bh=oQ654Y8vgazkW9Fx1rTOOfvrDoyHa0+Mtvm57jCjOUo=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=oiuSB6tt/knk88jxyT/tcwoaScFSJzQsLYieamrlQyBf9sjEQOB3K7hzfXecWm/uM
         9epiFm5lc9gF9kgFsnQkRAB2UJBizxSrcrMu6rZglKiSBn2SKXNGzolEyrbcVuTqvt
         kFnOqX8JNIigT53+NwMssbV7IGzg8fNRDG8clyNs=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.36.232]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MfqEy-1jmpX941pM-00NDyt; Tue, 12
 May 2020 14:32:24 +0200
Subject: Re: [v2] memory/samsung: reduce unnecessary mutex lock area
To:     Lukasz Luba <lukasz.luba@arm.com>, Bernard Zhao <bernard@vivo.com>,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, opensource.kernel@vivo.com,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>
References: <edf839ce-cc61-73dc-e017-b49648b94d1c@web.de>
 <c910fa00-c27b-9854-9ab2-6f37c28b87f6@arm.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <5a12fa12-f4e0-c941-b22b-33436723b44e@web.de>
Date:   Tue, 12 May 2020 14:32:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c910fa00-c27b-9854-9ab2-6f37c28b87f6@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
X-Provags-ID: V03:K1:7vj6CzdFvzTXkxGUCDdIycEJRwV/9+NWbNRMILlfg6XGAsQgjNL
 gVK/xIN74DtSp254wG8c3r6du0J8UfHSDtLaUBy787gcBk14SBtlnJ8DN5TotpRfmUPY5pT
 NsKKbyS+3X5v9BkdCSwnY7yuoRaMsc2sm2sfCxRMTPZmWUcjgIaFwLzrTZWCE1CNfJqSPn4
 1plEOwdeBS+AMeFNpL3pw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yl+gJRe44FA=:Deits6p83AxdOUjY/B59HL
 GfUDSm9bQpZYkKGTxplVIo6tR/pqApA3sIZ55/xWB8a0l3dt733bcUmxQ7vagZB+wzWWAorbl
 bkAo82XnkCdwieFUia0LRyeccWtm1ZomTgYeKuqh74BpqG47jSicMkUh4ntPqFZ6jiOM2KW0z
 c70CbWDsvK9DG6H+PO46npNGeAO16zCHlMx8lebBxk6HiLrxiQcBmadHnvqFQwDbd6oNR4tbE
 J/7mWfrwAjSCwQoExbIo8ScBrumbATigLtQpegE9oX/h7beHglEi8RFpQOM89UYod6bn5nwyT
 2lNIWvir9H+Z+5vyBD1dw4EAgE6YFlDFn16Z3vCP5rTXWkuOW81VuiPVjAicdFv/wxT22PLz4
 tI9FB8Y7Zt+CWDGYUdSDe+bIWryE7nV01VjJlUijzgTdAZz9j1ypk+2KTYdMfnLWGA4XK+HUA
 cbg4i6RaarZhXx2KaTT06f1wFh9rPTeLxyEnNK34/xmwMiRdWQif3N/JD2igytnIAHQZC+YOw
 a7oZ8hJNjXPyByC2TA8jzNPpx+RcUpWxriNI94TupQFh2y4uzVuakIXZatRJ/52pR/JJ2+OHw
 JuvOMCnHYip1/Ze9EILujZmpyldVBlnC7Z0/IZ6KHZLXbrKtmZS7CHOjH1VQtpnlDrQYQ9a3G
 V5xsvE3wmHEf/cAwJDhx1CDDBUXUc99pjbZVDMV52Y30Se/dmqaWDCRrMcRkfvPivSnNDR7vn
 vBrAizDARhADgAopyE8TWykElgEmaNPggQ5YZzC8Tl+gzbZUK5FkvbDTJjxxJ/QXB2wuKv01E
 HZvXAhTK/coNF1CTp+PmZUP2ReYvQv45sKFK8S+gPsGQR+p/ZKBDrC6N5/rTtXrTATqnQJSvl
 YXas4qJL0OcaoGrolc68y1e8Lj3BK1tGCIknHBNbnPllH1u1FnxUjc5UTGUbOPvKTf7YrT9ya
 LxiiBVXgf+ml7cpsOwMsKspMplvbQE5nTuar58q8eI4AiBdmbZ9QOKpuqGSKCRWT4YZ6bAtE3
 AdFoNYLz83l8+2NcpThXT4VGEmHt1N3Eaxtotr0AO4JfyrGzvHoP3c7+bfcNDDkyJ/GoMrDPH
 3/R8jvzLRy7SgDBFSpGN/JNaNnOCzPmr35heoBkX6zHUUM78acCPBYAw/ofGlyhoaue2FDA7y
 /U/pdDMHR6NYYzV8dvLRCxRYvoDi8bbl56aWBQ3XmdydpL0dbXXBef8Ge+YR1q43aMZg8LTmB
 gsfMDlfgQ4PNgOfDk
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> Something like: 'memory/samsung: reduce protected code area in IRQ
> handler' for the subject header would be better.
> Then in the message explain (without 'maybe') that it will speed-up a
> bit this IRQ processing and there is no need to protect return value
> or printing.

Do you tend to prefer smaller lock scopes for nicer run time characteristics?

Regards,
Markus
