Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCEB3F927A;
	Tue, 26 May 2026 12:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779797733; cv=none; b=id3cLux0IMiXKlFSp2/kVUwQLIpT8qpjmIjHawkYTL7sY5dmgVwR5cllk8m5JRdhAVwUsIOy6FWCeZY9XczUDs2QXEmwka+vKFWm6e85nYn6Br56Z+LDxOeUoKjh33YcR9uIz6aNtVUjRTISObjgJjRRj7xzpUeWg1bt4eRcmlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779797733; c=relaxed/simple;
	bh=hROfXyu+HusaxnSs+fQ0lOt15j4UEhRqeDAELsqJg9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H1Z2GLudQ8R6+6ffqwNdLMm8U7swhkyl6LNvtyj6v/W9yEQGERRXbNlgpumIaDo3H8OIs7zlxDRVfE0CAKmhwjFaYwj+r5/1qYkGgoH5T/ebnsKE0vFJDvs/xmeF2XCRoJXMHj4xqiboY5yokML8tWckldCDX3OKbhzFG36N8R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQsxy0hT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQsxy0hT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 355BE1F000E9;
	Tue, 26 May 2026 12:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779797731;
	bh=hROfXyu+HusaxnSs+fQ0lOt15j4UEhRqeDAELsqJg9M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SQsxy0hTfZZKvjxoPgDShYahn9MqOgHz3RO87iQN4ca3NRlzrqMgJhp02SjtnZiPX
	 0a8gi9DRfjIPTvESVFP/pPrJmXI/R9qlN0GwKhBDobQN9DiaxStUSBuU0CcfqLHJSq
	 XNfrKo+3wGJgki9ttljf69w+TcnKCeyPF2lVTcUMiIEi7LQsATNx3JftaN0FSeCq4e
	 lQoJVmeZtb6s735LadgCQjsVsrTDk67fQOSUKxoqyLEqvr2v4sZG9dny/qsGXsFUeg
	 3n3ZrnpGdDcsJVS6vzpBGVVHqsTQLiza+j3OB8SNLscYqc/fmhLXS14vn2I1hw0A1v
	 wMODrLPr8V9kA==
Message-ID: <76f25828-d696-4ae2-9df5-e8aca2d7b562@kernel.org>
Date: Tue, 26 May 2026 14:15:27 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "driver core: Use mod_delayed_work to prevent lost
 deferred probe work"
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20260526120306.184283-1-biju.das.jz@bp.renesas.com>
 <0e71f527-db39-4ad2-84d9-897464f74316@kernel.org>
 <TYCPR01MB11332849E0B017D12AA14085A860B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <TYCPR01MB11332849E0B017D12AA14085A860B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/26/26 2:14 PM, Biju Das wrote:
> I have tested your fix and it looks good on Renesas
> RZ/g2L SMARC EVK platform.
Great, feel free to reply with a Tested-by: tag in this case.

Thanks,
Danilo
