Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FC83E7624
	for <driver-core@lists.linux.dev>; Mon,  7 Sep 2026 02:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788748863; cv=none; b=Nbc/NrVLDvtljNJJnS4Al/CKptvB6raqMsYmu78/xmdrg/Yy14XndceDPXWUbmwIUKjW/ebbO9+JwxsK0yA3W4ZOo456yDBkZC4SLK27To9YpJuqqbMN9MQIXNKkGCycGbzLyaKCPgQRPocaBoJbAgahCXFDmFdQqMlkUoRUYMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788748863; c=relaxed/simple;
	bh=QVLfWEA/nYJvOFFKLHB9qWFUIQxOUrnYdOocmXK15bk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iIVWAuCBIZBzJt43WdGYXTcINxIGXMmz9ot9738lawVuJ3Pvv2EHFBJPozdvtDGyi+TWeQf4T6VPdtQlaIMffA46DnWaRUY4Qtu7hKKcdCIuh1aGiBSZIh1q+LmlEXW+v38oRjEbAZJiKkgkevjUnKKg71zLFckTy1PUxUBnE/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8c323fc2aa6511f19a56ed5b684f684d-20260907
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:fa411484-0a6f-4bfc-9b32-5337929392fd,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:098225e11ed550b1967a826b0350cc01,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|136|850|865|898,TC:nil,Content:0|15|5
	0|99,EDM:5|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8c323fc2aa6511f19a56ed5b684f684d-20260907
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1300207705; Mon, 07 Sep 2026 10:40:54 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Keith Busch <kbusch@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drivers/base/node: fix UAF on device_register() failure
Date: Mon,  7 Sep 2026 10:40:52 +0800
Message-Id: <20260907024052.1353224-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <DL0RZMS3MLF3.3AJP3BNVBV03Y@kernel.org>
References: <20260828012516.3591496-1-gonglinkai@kylinos.cn> <DL0RZMS3MLF3.3AJP3BNVBV03Y@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Aug 28, 2026 at 08:07:19PM +0200, Danilo Krummrich wrote:
> Sorry I didn't notice this in the first version, but why do we keep the goto
> labels at all if they both end with a return statement? Can't we just get rid of
> both?

You are right. Both labels only return, so the gotos are not needed.
I will send a v3 that inlines the two error paths.

Thanks,
Linkai
