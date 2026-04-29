Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91DC28CF77;
	Wed, 29 Apr 2026 20:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777493494; cv=none; b=CbYiamRKmPTXVBFoiCQ2p54vNxUJSZulgWLF+fxrphnXP/3BsFO7k7pg7HUWCKwSay09pZQ/iA1xuTcT3ErThcMb993Rbp3yuSssTvPYJITfyZXzescBu26ojvL5ssys7P6Hn1Hk5iOCi6hrvK49fw0yVl/lJwJyDcAKa+xWlR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777493494; c=relaxed/simple;
	bh=b/K0zCkxJbLMhVPvdWi1PFTRpDDSDat3DROdGTL7MJg=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:Mime-Version:
	 References:In-Reply-To; b=RybmElFEd1WAM58EGJx4JzjRJ2rFAEu6uh3xmsrNb3gudEUDC4MGngwVwxiA3h+v05uSgWUpabYVsx7mi9ThTeW+GQSrlsWSBQAKGZTbXJqCA5TSQ6DxCV5BZn2y8E8Oqwn+bEwpUt5iSwwI9zHk/OcPuWZW572cytUYoBSvjfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I59SNJlE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I59SNJlE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C931C19425;
	Wed, 29 Apr 2026 20:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777493494;
	bh=b/K0zCkxJbLMhVPvdWi1PFTRpDDSDat3DROdGTL7MJg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=I59SNJlEdkc0zhL6p3ieowt9AJGTAKUX2UDRqvbmbr0mUbWlq/uMlFUYT3AAifEd/
	 wtRC3J24zGSSUSvDwEo9ubj2DrEu69pE110o0/iZpyypzWdg0GTvDIC3DyGxXYBRQt
	 cPkOcPTLDXs9hJZRb8h42Ibq2cFEmeBXBhFu4DnGLzYmVLWAPH3smLGKpI11Dk4pdN
	 TLyuUzktAh0oB4Ns2v9UKDWwGDTIKf22tqrwHp0wbAihV+8STu0b+w5uxRLc7q2ieq
	 UOpGYyqUheROZMwbi7+XteRjAQwNzExQ90hotKbQTmcaZzJAKz7htj8J9VCatLfPpf
	 yXs6mxBT5GRNw==
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 22:11:31 +0200
Message-Id: <DI5WUT6CUDAN.3SI10HVHF3NWJ@kernel.org>
Subject: Re: [PATCH v2 1/2] driver core: faux: fix root device registration
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
To: "Johan Hovold" <johan@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260424153127.2647405-1-johan@kernel.org>
 <20260424153127.2647405-2-johan@kernel.org>
 <DI54XY4CNFCD.30M3UJGK1M3BE@kernel.org>
 <afHapCZz5C42euaD@hovoldconsulting.com>
 <DI5KV97TNS9D.28EQTYL46PKT1@kernel.org>
 <afHpUxQ5U_4RWjDZ@hovoldconsulting.com>
 <DI5PDWIV7N7X.16VB7OPUTJ6ZK@kernel.org>
 <afIdl9VcaXxBb0Ll@hovoldconsulting.com>
In-Reply-To: <afIdl9VcaXxBb0Ll@hovoldconsulting.com>

On Wed Apr 29, 2026 at 5:02 PM CEST, Johan Hovold wrote:
> Again, feel free to drop the CC stable tag if you want to.

It's not so much about what I want -- I just try to stay close to what the
guideline is, and only deviate when there's a good reason.
