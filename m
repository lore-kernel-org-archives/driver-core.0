Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7E63F20FA;
	Tue, 30 Jun 2026 10:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815278; cv=none; b=HTa2K1/S65GPRXicJ4MoTm44Zit7TWYsUbReqGPiqRoCsenpw3fN2yLEuuG0wC/xyCw9H/pZzR+vQGgje/iHH0/x/3VmtHYyRCqDEECsxcJzhmrBNzJTbLBphu9fL+9I+yvuXGAg1Xhit1+kqlsBlhFHKiiRJ9hQPZ30dqk/M4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815278; c=relaxed/simple;
	bh=RcGN0eY6HkMIt+i3fdn7q/1kbyBN0Ew6l1ZUmATMokA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwZ6BaTpcjcesaRyEKssXZvw18y6n1mIch2OB46tqVxzq1Q+G0JztFnAVCynDP7Erks5URUQ6rvhH4NlW55wa7LOGlUZJ4ZJvo+hXxpTMvh34Ch7KaFCc+YkDDRYF9RjPOS2eUv5rnQ1K2/FSUBxQtDy7xdbPr6k4KShTBbSJXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=t4zq6JRt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="t4zq6JRt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3981F00A3A;
	Tue, 30 Jun 2026 10:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782815276;
	bh=nwsBNg1Uz1g/kkMSrh8+gbaIpyvXtoLSwD3ADs7uTi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=t4zq6JRtZUKGTwwDHK/GmDTOjFYY7iIdzvyg66gEIMRIGYmrScWzVTvaSm0S6iCOX
	 K3pugOEIsZ1ArNpfRxks8U+gzxf+AMQG42Fxhus5XodSOYQ9AdEF2NXDp2x1ma2ZV9
	 A4sj/EctptHcpS54V+M1KRaPWlQSmM6h/vCs4HuA=
Date: Tue, 30 Jun 2026 12:27:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: dakr@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, rafael@kernel.org
Subject: Re: [PATCH] docs: ABI: sysfs-uevent: add missing bracket
Message-ID: <2026063044-siamese-sagging-b560@gregkh>
References: <20260612145331.189632-2-manuelebner@mailbox.org>
 <0ffa2438b7d7d131e71e118f1a3893c471080cd7.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ffa2438b7d7d131e71e118f1a3893c471080cd7.camel@mailbox.org>

On Mon, Jun 29, 2026 at 02:42:26PM +0200, Manuel Ebner wrote:
> 
> is this patch still on it's way?

There is no context here :(
