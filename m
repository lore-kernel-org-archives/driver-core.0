Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C71258CE7
	for <driver-core@lists.linux.dev>; Tue, 21 Jul 2026 03:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784605020; cv=none; b=Lc2iBivz5fLiuCufQJjvW+DmfqWgHTMC4yuZPUVNy55zII7b/ihVhJ/dezSsGD6dC/dUA135mUzt2qQ2+Aj7LgZ54AOhu5PDiBff1u2Sfi7cfaPsDOI05OHgp7iW7mOCsygEJsvJ3SfDdZiAvz4kMawhX/oPqBorfW6NdJBvDSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784605020; c=relaxed/simple;
	bh=W8c2i5ZcwuT56JVlHFfPCFBpoLgoi0BlaYKksTMqxuw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Yh2gRVV7UJ89+2OY8V9pDI8mZ8PFRJcAqxvZ7aiTXokEuOvtTTklJ/G7miAFjM+NxHDfTVNc2B1Slj8XvcIex5lmg/WeomdXvjr21nBk23fshI0GqPeUqLRh6Kc1PWKBuZPOvemmWbIQpasKUtjcXbcCEthE6jD3dVXoag3Aph4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 6918b0dc84b511f1aa26b74ffac11d73-20260721
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_MISS
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_LANG
	HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN
	HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_EXISTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_GOOD, CIE_GOOD_SPF
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:14a9b360-4d9c-4de3-8f3c-81ce759af140,IP:15,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:15
X-CID-INFO: VERSION:1.3.12,REQID:14a9b360-4d9c-4de3-8f3c-81ce759af140,IP:15,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:15
X-CID-META: VersionHash:e7bac3a,CLOUDID:878090dbb8ecf410c52a5242ce187c75,BulkI
	D:260721113652U5GJ6OFM,BulkQuantity:0,Recheck:0,SF:10|64|66|78|80|81|82|83
	|102|127|817|841|850|865|898,TC:nil,Content:-10|-8|-5|14|50,EDM:-3,IP:-2,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6918b0dc84b511f1aa26b74ffac11d73-20260721
X-User: yijiangshan@kylinos.cn
Received: from localhost.localdomain [(116.128.244.171)] by mailgw.kylinos.cn
	(envelope-from <yijiangshan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 97395458; Tue, 21 Jul 2026 11:36:51 +0800
From: Jiangshan Yi <yijiangshan@kylinos.cn>
To: gregkh@linuxfoundation.org
Cc: 13667453960@163.com,
	dakr@kernel.org,
	driver-core@lists.linux.dev,
	johannes@sipsolutions.net,
	linux-kernel@vger.kernel.org,
	rafael@kernel.org,
	yijiangshan@kylinos.cn
Subject: Re: Re: [PATCH] base: devcoredump: Replace simple_strtol with kstrtol
Date: Tue, 21 Jul 2026 11:36:21 +0800
Message-Id: <20260721033621.200399-1-yijiangshan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2026072024-eggbeater-strewn-87ed@gregkh>
References: <2026072024-eggbeater-strewn-87ed@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Be careful, we are rejecting ABI changes like this as there is no real
> reason to change this at this point in time, right?
>
> thanks,
>
> greg k-h

Hi Greg,

You're right, thanks for catching this.

The intent was only to drop the obsolete simple_strtol() call. I
didn't properly consider that switching to kstrtol() also tightens
the accepted input for the sysfs store path - e.g. "1<garbage>"
currently parses as 1 and enables lockdown, while with kstrtol() it
would return -EINVAL. That's a userspace-visible behavior change in a
long-stable interface, which isn't justified by just cleaning up an
obsolete helper.

I'll drop this patch.

If on the other hand you'd prefer the stricter behavior as a
deliberate ABI change, I can resend it, but I won't unless you want
it.

thanks,
Jiangshan Yi
